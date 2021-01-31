# Creates the folder structure
import os

proc createStructure() =#name:string) =
  if not dirExists("./fmu"):
    createDir( "./fmu" )
  
  if not dirExists("fmu/binaries"):
    createDir( "fmu/binaries" )  

  if not dirExists("fmu/binaries/linux64"):
    createDir( "fmu/binaries/linux64" ) 

  if not dirExists("fmu/documentation"):
    createDir( "fmu/documentation" )  

  if not dirExists("fmu/sources"):
    createDir( "fmu/sources" ) 

when isMainModule:
  createStructure()
