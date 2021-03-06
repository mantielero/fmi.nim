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


</fmiModelDescription>



]#
import xmltree, strformat, options
import ../parameters
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
    variables:seq[Param]  #seq[ScalarVariable]
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

proc scalarVariable(p:Param, idx: int):XmlNode =
 #echo idx
  var scalarVariableAttrs = @[(key:"name", val:p.name), (key:"valueReference", val:fmt"{idx}")]
  if p.description.isSome:
    scalarVariableAttrs.add (key:"description", val:p.description.get)
  if p.causality.isSome:
    scalarVariableAttrs.add (key:"causality", val: $p.causality.get)
  if p.variability.isSome:
    scalarVariableAttrs.add (key:"variability", val: $p.variability.get)    
  if p.initial.isSome:
    scalarVariableAttrs.add (key:"initial", val: $p.initial.get) 

  let attrs = scalarVariableAttrs.toXmlAttributes

  let initial = case p.kind:
                of tInteger: newElement("Integer")
                of tReal:    newElement("Real")
                of tBoolean: newElement("Boolean")
                of tString:  newElement("String")
  var initialAttrs:seq[(string,string)]
  case p.kind:
  of tInteger:
    if p.startI.isSome:
      initialAttrs.add (key:"start", val:fmt"{p.startI.get}")
  of tBoolean:
    if p.startB.isSome:
      initialAttrs.add (key:"start", val:fmt"{p.startB.get}")  
  of tString:
    if p.startS.isSome:
      initialAttrs.add (key:"start", val:fmt"{p.startS.get}")        
  of tReal:
    if p.startR.isSome:
      initialAttrs.add (key:"start", val:fmt"{p.startR.get}")      
    if p.derivative.isSome:
      initialAttrs.add (key:"derivative", val:fmt"{p.derivative.get}") 
    if p.reinit.isSome:
      initialAttrs.add (key:"reinit", val:fmt"{p.reinit.get}")        

  initial.attrs = initialAttrs.toXmlAttributes

  let scalarVariable = newXmlTree("ScalarVariable", [initial], attrs)

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
  for idx, i in md.variables:
    children.add i.scalarVariable idx  #i.get
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
  #echo repr modelStructure
  #let modelVariables = md.variables.get
  #let modelExchange 
  return newXmlTree( "fmiModelDescription", 
                     [model, logCategories, modelVariables, modelStructure], 
                     attributes )

proc createXml*( modelName, guid: string, numberOfEventIndicators:int,
                params:seq[Param] ):string =
  ##[
  Creates the XML string from the data
  ]##

  var att = FmiModelDescriptionAttributes( fmiVersion:2, 
                                           modelName:modelName,
                                           guid:guid, 
                                           numberOfEventIndicators:numberOfEventIndicators )
                                        
  var xmldata = FmiModelDescription( kind: mkModelExchange) #, 

                                   #)
  xmldata.attr = att

  #var modelExchange = getModelExchange(modelName, @["inc.c"])
  #xmldata.kind = mkModelExchange
  xmldata.modelExchange = ModelExchange( modelIdentifier: modelName,
                                         files: @["inc.c"] )
  xmldata.logCategories = @["logAll", "logError", "logFmiCall", "logEvent"]


  for p in params:
    xmldata.variables.add p#.scalarVariable#.get #scalarVariable(param)

  # Create the model structure
  var md:ModelStructure
  for idx, p in params:
    if p.derivative.isSome:       
      var unk:Unknown
      unk.index = idx.uint
      if md.derivatives.isNone:      
        md.derivatives = @[unk].some
        md.initialUnknowns = @[unk].some
      else:
        md.derivatives.get.add unk
        md.initialUnknowns.get.add unk        

  xmldata.structure = md

  return xmlHeader & $xmldata.gen

when isMainModule:
  echo createXml("inc", "{8c4e810f-3df3-4a00-8276-176fa3c9f008}", 0)
