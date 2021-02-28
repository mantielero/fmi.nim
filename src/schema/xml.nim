#https://rosettacode.org/wiki/XML/Output#Nim
#[
<?xml version="1.0" encoding="ISO-8859-1"?>
<fmiModelDescription
  fmiVersion="2.0"
  modelName="dq"
  guid="{8c4e810f-3df3-4a00-8276-176fa3c9f000}"
  numberOfEventIndicators="0">


<ModelVariables>
  <ScalarVariable name="x" valueReference="0" description="the only state"
                  causality="local" variability="continuous" initial="exact">
    <Real start="1"/>
  </ScalarVariable>
  <ScalarVariable name="der(x)" valueReference="1"
                  causality="local" variability="continuous" initial="calculated">
    <Real derivative="1"/>
  </ScalarVariable>
  <ScalarVariable name="k" valueReference="2"
                  causality="parameter" variability="fixed" initial="exact">
    <Real start="1"/>
  </ScalarVariable>
</ModelVariables>

<ModelStructure>
  <Derivatives>
    <Unknown index="2" />
  </Derivatives>
  <InitialUnknowns>
    <Unknown index="2"/>
  </InitialUnknowns>
</ModelStructure>

</fmiModelDescription>



]#
import xmltree, strformat, options
import ../params
import modelVariables, structure

type
  FmiModelDescriptionAttributes = object  
    fmiVersion:int # ="2.0"
    modelName:string #="dq"
    guid:string   #="{8c4e810f-3df3-4a00-8276-176fa3c9f000}"
    numberOfEventIndicators:int #="0">
  
  LogCategories = seq[string]

  ModelExchange = object
    modelIdentifier:string
    files:seq[string]

  CoSimulation = object
    modelIdentifier:string
    canHandleVariableCommunicationStepSize:bool
    files:seq[string]

  ModelKind = enum
     mkModelExchange, mkCoSimulation

  FmiModelDescription = object
    attr:FmiModelDescriptionAttributes
    case kind:ModelKind
    of mkModelExchange: 
      modelExchange:ModelExchange
    of mkCoSimulation:
      coSimulation:CoSimulation
    logCategories:LogCategories
    variables:seq[ScalarVariable]
    structure:ModelStructure


proc getAttributes( att:FmiModelDescriptionAttributes):XmlAttributes = 
  if att.fmiVersion != 2:
    quit("Only fmiVersion 2 is supported", QuitFailure)
  if att.modelName == "":
    quit("Empty modelName is not accepted", QuitFailure)
  if att.guid == "":
    quit("Empty guid is not accepted", QuitFailure)

  return { "fmiVersion": fmt"{att.fmiVersion}.0",
           "modelName": att.modelName,
           "guid": att.guid,
           "numberOfEventIndicators" : fmt"{att.numberOfEventIndicators}" }.toXmlAttributes
  #let k = newXmlTree("fmiModelDescription", [modelExchange, logCategories, modelVariables, modelStructure], att)


proc get( me:ModelExchange ):XmlNode =
  #[
  <ModelExchange
    modelIdentifier="dq">
    <SourceFiles>
      <File name="dq.c"/>
    </SourceFiles>
  </ModelExchange>    
  ]#
  var files:seq[XmlNode]
  for sourceFile in me.files:
    var file = newElement("File")
    file.attrs  = {"name" : fmt"{sourceFile}"}.toXmlAttributes
    files.add file
  #let fileFinal = newXmlTree( file, @[], fileAtt)
  let sourceFiles = newXmlTree("SourceFiles", files)

  let meAtt = { "modelIdentifier" : fmt"{me.modelIdentifier}" }.toXmlAttributes
  return newXmlTree("ModelExchange", [sourceFiles], meAtt)


proc get( me:CoSimulation ):XmlNode =
  #[
  <ModelExchange
    modelIdentifier="dq">
    <SourceFiles>
      <File name="dq.c"/>
    </SourceFiles>
  </ModelExchange>    
  ]#
  var files:seq[XmlNode]
  for sourceFile in me.files:
    var file = newElement("File")
    file.attrs  = {"name" : fmt"{sourceFile}"}.toXmlAttributes
    files.add file
  #let fileFinal = newXmlTree( file, @[], fileAtt)
  let sourceFiles = newXmlTree("SourceFiles", files)

  let meAtt = { "modelIdentifier" : fmt"{me.modelIdentifier}" }.toXmlAttributes
  return newXmlTree("CoSimulation", [sourceFiles], meAtt)

proc get( categories: LogCategories ):XmlNode =
  #[
  <LogCategories>
    <Category name="logAll"/>
    <Category name="logError"/>
    <Category name="logFmiCall"/>
    <Category name="logEvent"/>
  </LogCategories>    
  ]#
  var catChildren:seq[XmlNode] = @[]
  for category in categories:
    var cat = newElement("Category")
    cat.attrs  = {"name" : fmt"{category}"}.toXmlAttributes
    catChildren.add(cat)
  return newXmlTree("LogCategories", catChildren)

proc `$`(v:Causality):string =
  case v:
  of cParameter:           "parameter"
  of cCalculatedParameter: "calculatedParameter"
  of cInput:               "input"
  of cOutput:              "output"
  of cLocal:               "local"
  of cIndependent:         "independent"

proc `$`(v:Variability):string =
  case v:
  of vConstant:   "constant"
  of vFixed:      "fixed"
  of vTunable:    "tunable"
  of vDiscrete:   "discrete"
  of vContinuous: "continuous"

proc `$`(v:Initial):string =
  case v:
  of iExact: "exact"
  of iApprox: "approx"
  of iCalculated: "calculated"

proc scalarVariable[P:(ParamI | ParamR | ParamB | ParamS)](p:P):XmlNode =
  let scalarVariableAttrs = { "name" : p.name,
                              "valueReference" : fmt"{p.idx}",
                              "description" : p.description,
                              "causality" : $p.causality,
                              "variability" : $p.variability,
                              "initial" : $p.initial }.toXmlAttributes

  let initial = case p.typ:
                of tInt:    newElement("Integer")
                of tFloat:  newElement("Real")
                of tBool:   newElement("Boolean")
                of tString: newElement("String")
  initial.attrs = { "start" : fmt"{p.initVal}"}.toXmlAttributes

  let scalarVariable = newXmlTree("ScalarVariable", [initial], scalarVariableAttrs)

  return scalarVariable



proc gen(md:FmiModelDescription):XmlNode =
  let attributes = md.attr.getAttributes
  
  var model:XmlNode
  case md.kind
  of mkModelExchange:
    model = md.modelExchange.get
  of mkCoSimulation:
    model = md.coSimulation.get
  
  let logCategories = md.logCategories.get


  var children:seq[XmlNode]
  for i in md.variables:
    children.add i.get
  var modelVariables = newXmlTree( "ModelVariables", children )

  #var modelStructure = newElement("ModelStructure")
  #var outputs = newElement("Outputs")
  #var unknown = newElement("Unknown")
  #unknown.attrs = {"index" : "1" }.toXmlAttributes
  #outputs.add unknown
  #modelStructure.add outputs
  #[
  let att = { "fmiVersion": "2.0",
              "modelName": fmt"{modelName}",
              "guid": fmt"{guid}",
              "numberOfEventIndicators" : fmt"{numberOfEventIndicators}"}.toXmlAttributes
  ]#
  let modelStructure = md.structure.get
  #let modelVariables = md.variables.get
  #let modelExchange 
  return newXmlTree( "fmiModelDescription", 
                     [model, logCategories, modelVariables, modelStructure], 
                     attributes )

proc createXml*( modelName, guid: string, numberOfEventIndicators:int,
                paramsI:seq[ParamI], 
                paramsR:seq[ParamR], 
                paramsB:seq[ParamB], 
                paramsS:seq[ParamS] ):string =

  var att = FmiModelDescriptionAttributes( fmiVersion:2, 
                                           modelName:modelName,
                                           guid:guid, 
                                           numberOfEventIndicators:numberOfEventIndicators )
                                        
  var xmldata = FmiModelDescription( kind: mkModelExchange, 
                                     modelExchange: ModelExchange( 
                                                      modelIdentifier: modelName,
                                                      files: @["inc.c"] ) 
                                   )
  xmldata.attr = att

  #var modelExchange = getModelExchange(modelName, @["inc.c"])
  #xmldata.kind = mkModelExchange
  #xmldata.modelExchange = ModelExchange( modelIdentifier: modelName,
  #                                       files: @["inc.c"] )
  xmldata.logCategories = @["logAll", "logError", "logFmiCall", "logEvent"]
  

  #variables:seq[ScalarVariable]
  #structure:ModelStructure  
  
  #let logCategories = getLogCategories( categories )

  


  #var modelVariables = newElement("ModelVariables")


  for p in paramsI:
    var scalarVariable = ScalarVariable(kind:svkInteger)
    scalarVariable.name = p.name
    scalarVariable.valueReference = p.idx.uint
    scalarVariable.description = some( p.description )
    scalarVariable.causality = some( $p.causality )
    scalarVariable.variability = some( $p.variability )
    scalarVariable.initial = some( $p.initial )
    #scalarVariable.kind = svkInteger
    var integer:Integer
    #a.declaredType = some("prueba")
    integer.start = some(p.initVal)
    #a.derivative = some(2.uint)
    scalarVariable.childInteger = integer
    #echo repr param
    #discard
    xmldata.variables.add scalarVariable#.get #scalarVariable(param)

  for p in paramsR:
    var scalarVariable = ScalarVariable(kind: svkReal )
    scalarVariable.name = p.name
    scalarVariable.valueReference = p.idx.uint
    scalarVariable.description = some( p.description )
    scalarVariable.causality = some( $p.causality )
    scalarVariable.variability = some( $p.variability )
    scalarVariable.initial = some($p.initial )
    #scalarVariable.kind = svkReal
    var real:Real
    #a.declaredType = some("prueba")
    real.start = some(p.initVal)
    #a.derivative = some(2.uint)
    scalarVariable.childReal = real
    xmldata.variables.add scalarVariable#.get #scalarVariable(param)








  return xmlHeader & $xmldata.gen
  #result = xmlHeader & $k

when isMainModule:
  echo createXml("inc", "{8c4e810f-3df3-4a00-8276-176fa3c9f008}", 0)
