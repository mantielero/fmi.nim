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
import options, xmltree, strformat



type
  Fmi2RealAttributes = object
    quantity:Option[string]
    unit:Option[string]
    displayUnit:Option[string]
    relativeQuantity:Option[bool]
    min:Option[float]
    max:Option[float]
    nominal:Option[float]
    unbounded:Option[bool]


  Real* = object
    declaredType*:Option[string]
    attr*:Fmi2RealAttributes
    start*:Option[float]
    derivative*:Option[uint]
    reinit*:Option[bool]

proc get(r:Real):XmlNode =
  var att:seq[(string,string)]
  if r.declaredType.isSome:
    att.add ("declaredType", r.declaredType.get)

  if r.attr.quantity.isSome:
    att.add ("quantity", r.attr.quantity.get)  
  if r.attr.unit.isSome:
    att.add ("unit", r.attr.unit.get)  
  if r.attr.displayUnit.isSome:
    att.add ("displayUnit", r.attr.displayUnit.get)  
  if r.attr.relativeQuantity.isSome:
    att.add ("relativeQuantity", fmt"{r.attr.relativeQuantity.get}") 
  if r.attr.min.isSome:
    att.add ("min", fmt"{r.attr.min.get}")      
  if r.attr.max.isSome:
    att.add ("max", fmt"{r.attr.max.get}") 
  if r.attr.nominal.isSome:
    att.add ("nominal", fmt"{r.attr.nominal.get}") 
  if r.attr.unbounded.isSome:
    att.add ("unbounded", fmt"{r.attr.unbounded.get}") 

  if r.start.isSome:
    att.add ("start", fmt"{r.start.get}") 
  if r.derivative.isSome:
    att.add ("derivative", fmt"{r.derivative.get}") 
  if r.reinit.isSome:
    att.add ("reinit", fmt"{r.reinit.get}") 

  let attributes = att.toXmlAttributes

  return newXmlTree("Real", [], attributes)


type
  Fmi2IntegerAttributes = object
    quantity:Option[string]
    min:Option[int]
    max:Option[int]

  Integer* = object
    declaredType*:Option[string]
    attr*:Fmi2RealAttributes
    start*:Option[int]

proc get(r:Integer):XmlNode =
  var att:seq[(string,string)]
  if r.declaredType.isSome:
    att.add ("declaredType", r.declaredType.get)

  if r.attr.quantity.isSome:
    att.add ("quantity", r.attr.quantity.get)  
  if r.attr.min.isSome:
    att.add ("min", fmt"{r.attr.min.get}")      
  if r.attr.max.isSome:
    att.add ("max", fmt"{r.attr.max.get}") 

  if r.start.isSome:
    att.add ("start", fmt"{r.start.get}") 

  let attributes = att.toXmlAttributes

  return newXmlTree("Integer", [], attributes)

type
  Boolean* = object
    declaredType*:Option[string]
    start*:Option[bool]

proc get(r:Boolean):XmlNode =
  var att:seq[(string,string)]
  if r.declaredType.isSome:
    att.add ("declaredType", r.declaredType.get)

  if r.start.isSome:
    att.add ("start", fmt"{r.start.get}") 

  let attributes = att.toXmlAttributes

  return newXmlTree("Boolean", [], attributes)    

type
  String = object
    declaredType:Option[string]
    start:Option[string]


proc get(r:String):XmlNode =
  var att:seq[(string,string)]
  if r.declaredType.isSome:
    att.add ("declaredType", r.declaredType.get)

  if r.start.isSome:
    att.add ("start", r.start.get) 

  let attributes = att.toXmlAttributes

  return newXmlTree("String", [], attributes) 


type
  Enumeration = object
    declaredType:string
    quantity:Option[string]
    min:Option[int]
    max:Option[int]
    start:Option[int]    

proc get(r:Enumeration):XmlNode =
  var att:seq[(string,string)]
  if r.declaredType == "":
    quit("`declaredType` needs to contain a string", QuitFailure)
  att.add ("declaredType", r.declaredType)

  if r.quantity.isSome:
    att.add ("quantity", r.quantity.get)  
  if r.min.isSome:
    att.add ("min", fmt"{r.min.get}")      
  if r.max.isSome:
    att.add ("max", fmt"{r.max.get}") 
  if r.start.isSome:
    att.add ("start", fmt"{r.start.get}") 

  let attributes = att.toXmlAttributes

  return newXmlTree("Enumeration", [], attributes)
#[
type
  ScalarVariableKind* = enum
     svkReal, svkInteger, svkBoolean, svkString, svkEnumeration
  ScalarVariable* = object
    #attrib:ScalarVariableAttributes
    name*: string
    valueReference*:uint
    description*:Option[string]
    causality*:Option[string]
    variability*:Option[string]
    initial*:Option[string]
    canHandleMultipleSetPerTimeInstant*:Option[string]    
    case kind*: ScalarVariableKind
    of svkReal:
      childReal*:Real
    of svkInteger:
      childInteger*:Integer
    of svkBoolean:
      childBoolean*:Boolean
    of svkString:
      childString*:String
    of svkEnumeration:
      childEnumeration*:Enumeration                 
]#



when isMainModule:
  var a:Real
  #a.declaredType = some("prueba")
  #a.start = some(1.0)
  a.derivative = some(2.uint)

  var b:Boolean
  b.start = some(true)

  var c:String
  c.start = some("hola")

  var scalar:ScalarVariable = ScalarVariable(kind:svkReal, childReal:a)
  scalar.name = "hola"
  scalar.valueReference = 3.uint
  
  var children:seq[XmlNode]
  children.add scalar.get
  let k = newXmlTree("prueba", children, nil )
  echo $k
