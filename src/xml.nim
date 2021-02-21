import params
#https://rosettacode.org/wiki/XML/Output#Nim
#[
<?xml version="1.0" encoding="ISO-8859-1"?>
<fmiModelDescription
  fmiVersion="2.0"
  modelName="inc"
  guid="{8c4e810f-3df3-4a00-8276-176fa3c9f008}"
  numberOfEventIndicators="0">

<ModelExchange
  modelIdentifier="inc">
  <SourceFiles>
    <File name="inc.c"/>
  </SourceFiles>
</ModelExchange>

<LogCategories>
  <Category name="logAll"/>
  <Category name="logError"/>
  <Category name="logFmiCall"/>
  <Category name="logEvent"/>
</LogCategories>

<ModelVariables>
  <ScalarVariable name="counter" valueReference="0" description="counts the seconds"
                  causality="output" variability="discrete" initial="exact">
     <Integer start="1"/>
  </ScalarVariable>
</ModelVariables>

<ModelStructure>
  <Outputs>
    <Unknown index="1" />
  </Outputs>
</ModelStructure>

</fmiModelDescription>


]#

import xmltree
import strformat


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


proc createXml*( modelName, guid: string, numberOfEventIndicators:int,
                paramsI:seq[ParamI], 
                paramsR:seq[ParamR], 
                paramsB:seq[ParamB], 
                paramsS:seq[ParamS] ):string =
  #var fmiModelDescription = newElement("fmiModelDescription")
  #fmiModelDescription.add newText("some text")
  #fmiModelDescription.add newComment("this is comment")

  #var h = newElement("secondTag")
  #h.add newEntity("some entity")



  var file = newElement("File")
  file.attrs  = {"name" : "inc.c"}.toXmlAttributes
  #let fileFinal = newXmlTree( file, @[], fileAtt)
  let sourceFiles = newXmlTree("SourceFiles", [file])

  let meAtt = { "modelIdentifier" : fmt"{modelName}" }.toXmlAttributes
  var modelExchange = newXmlTree("ModelExchange", [sourceFiles], meAtt)

  var categories = @["logAll", "logError", "logFmiCall", "logEvent"]
  var catChildren:seq[XmlNode] = @[]
  for category in categories:
    var cat = newElement("Category")
    cat.attrs  = {"name" : fmt"{category}"}.toXmlAttributes
    catChildren.add(cat)
  let logCategories = newXmlTree("LogCategories", catChildren)



  #var scalarVariable = newElement("ScalarVariable")
  var modelVariables = newElement("ModelVariables")

  for param in paramsI:
    #echo repr param
    #discard
    modelVariables.add scalarVariable(param)

  #[
  let scalarVariableAttrs = { "name" : "counter",
                              "valueReference" : "0",
                              "description" : "counts the seconds",
                              "causality" : "output",
                              "variability" : "discrete",
                              "initial" : "exact" }.toXmlAttributes
  echo repr scalarVariableAttrs
  let initial = newElement("Integer")
  initial.attrs = { "start" : "1"}.toXmlAttributes


  let scalarVariable = newXmlTree("ScalarVariable", [initial], scalarVariableAttrs)
  ]#




  var modelStructure = newElement("ModelStructure")
  var outputs = newElement("Outputs")
  var unknown = newElement("Unknown")
  unknown.attrs = {"index" : "1" }.toXmlAttributes
  outputs.add unknown
  modelStructure.add outputs

  let att = { "fmiVersion": "2.0",
              "modelName": fmt"{modelName}",
              "guid": fmt"{guid}",
              "numberOfEventIndicators" : fmt"{numberOfEventIndicators}"}.toXmlAttributes
  let k = newXmlTree("fmiModelDescription", [modelExchange, logCategories, modelVariables, modelStructure], att)
  result = xmlHeader & $k

when isMainModule:
  echo createXml("inc", "{8c4e810f-3df3-4a00-8276-176fa3c9f008}", 0)
