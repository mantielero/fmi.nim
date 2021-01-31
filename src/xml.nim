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


proc createXml() =
  var g = newElement("myTag")
  g.add newText("some text")
  g.add newComment("this is comment")

  var h = newElement("secondTag")
  h.add newEntity("some entity")

  let att = {"key1": "first value", "key2": "second value"}.toXmlAttributes
  let k = newXmlTree("treeTag", [g, h], att)
  echo $k

when isMainModule:
  createXml()