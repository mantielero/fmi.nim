##[
The "ModelVariables" element of fmiModelDescription is the central part of
the model description. It provides the static information of all exposed 
variables and is defined as:

.. ![](https://github.com/modelica/fmi-standard/blob/release/v2.0.2/docs/images/ModelVariables_schema.png)

.. image:: https://github.com/modelica/fmi-standard/blob/release/v2.0.2/docs/images/ModelVariables_schema.png
   :width: 100%
   
   
.. :target: https://github.com/modelica/fmi-standard/blob/release/v2.0.2/docs/images/ModelVariables_schema.png

The "ModelVariables" element consists of an ordered set of ScalarVariable elements
(see figure above). The first element has index = 1, the second index=2, etc. This
ScalarVariable index is used in element ModelStructure to uniquely and efficiently
refer to ScalarVariable definitions. A ScalarVariable represents a variable of
primitive type, like a real or integer variable. For simplicity, only scalar variables
are supported in the schema file in this version and structured entities (like arrays
or records) have to be mapped to scalars. The schema definition is present in a separate
file fmi2ScalarVariable.xsd. The attributes of ScalarVariable are:

.. ![](https://github.com/modelica/fmi-standard/blob/release/v2.0.2/docs/images/ScalarVariable_schema.png)


]##

#type
#  ScalarVariable = 



##[
Type specific properties are defined in the required choice element, where exactly one of "Real",
"Integer", "Boolean", "String", "Enumeration" must be present in the XML file:
]##
import options, xmltree, strformat, strutils, typetraits



type
  DependenciesKind* = enum
    dkDependent, dkConstant, dkFixed, dkTunable, dkDiscrete
  Unknown* = object
    index*:uint
    dependencies*:Option[seq[uint]]
    dependenciesKind*:Option[seq[DependenciesKind]]

proc `$`(dk:DependenciesKind):string =
  result = case dk
           of dkDependent: "dependent"
           of dkConstant:  "constant"
           of dkFixed:     "fixed"
           of dkTunable:   "tunable"
           of dkDiscrete:  "discrete"

proc get(r:Unknown):XmlNode =
  var att:seq[(string,string)]
  if r.index == 0:
      quit("`index` needs to be >0", QuitFailure)
  att.add ("index", fmt"{r.index}")

  if r.dependencies.isSome:
    var str = ""
    for i in r.dependencies.get:
        str &= $i & " "
    str = str.strip
    att.add ("dependencies", str)

  if r.dependenciesKind.isSome:
    var str = ""
    for i in r.dependenciesKind.get:
        str &= $i & " "
    str = str.strip
    att.add ("dependenciesKind", str)


  let attributes = att.toXmlAttributes

  return newXmlTree("Unknown", [], attributes)

#[
type
  Outputs* = seq[Unknown] #object
  Derivatives* = seq[Unknown]
  InitialUnknowns* = seq[Unknown]  
]#

#proc get[T:OutPuts | Derivatives | InitialUnknowns](r:T):XmlNode =
proc get(r:seq[Unknown]):seq[XmlNode] =
  #var tag = r.type.name
  #echo tag
  var children:seq[XmlNode]
  for i in r:
    children.add i.get
  #return newXmlTree(tag, children)
  return children

type
  ModelStructure* = object
    outputs*:         Option[seq[Unknown]] #Option[Outputs] # = seq[Unknown]#object
    derivatives*:     Option[seq[Unknown]] #Option[Derivatives]# = distinct Outputs
    initialUnknowns*: Option[seq[Unknown]] #Option[InitialUnknowns] #= distinct Outputs    

proc get*(r:ModelStructure):XmlNode =
  var children:seq[XmlNode]
  if r.outputs.isSome:
    var ch = r.outputs.get.get
    children.add newXmlTree("Outputs", ch)
  if r.derivatives.isSome:
    var ch = r.derivatives.get.get
    children.add newXmlTree("Derivatives", ch)
  if r.initialUnknowns.isSome:
    var ch = r.initialUnknowns.get.get
    children.add newXmlTree("InitialUnknowns", ch)
  
  return newXmlTree("ModelStructure", children, nil)


when isMainModule:
  var a = Unknown(index: 8.uint, dependencies: some(@[6.uint]))
  var b:Unknown
  b.index = 11
  b.dependencies = some(@[2.uint, 4.uint, 5.uint, 6.uint])
  b.dependenciesKind = some(@[dkConstant, dkConstant, dkDependent, dkFixed])
  var c = Unknown(index: 8, dependencies: some(@[2.uint, 3.uint, 4.uint, 5.uint, 6.uint]))
  var derivatives = @[a, b, c]

  var ms:ModelStructure
  ms.derivatives = some(derivatives)
  #a.declaredType = some("prueba")
  #a.start = some(1.0)
  #a.derivative = some(2.uint)

  #var b:Boolean
  #b.start = some(true)

  #var c:String
  #c.start = some("hola")

  #var scalar:ScalarVariable = ScalarVariable(kind:svkReal, childReal:a)
  #scalar.name = "hola"
  #scalar.valueReference = 3.uint
  
  var children:seq[XmlNode]
  children.add ms.get
  let k = newXmlTree("prueba", children, nil )
  echo $k
