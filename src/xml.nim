#https://rosettacode.org/wiki/XML/Output#Nim
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