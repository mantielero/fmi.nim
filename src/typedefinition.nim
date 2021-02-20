import macros
import definitions

macro genModelInstance*( numberOfReals, numberOfIntegers,
               numberOfBooleans, numberOfStrings,
               numberOfStates, numberOfEventIndicators,
               nCategories: static[int]): untyped =
  let modelInstance = nnkPostfix.newTree(
                        newIdentNode("*"),
                        newIdentNode("ModelInstance")
                      )

  let mytype = nnkPostfix.newTree(
                 newIdentNode("*"),
                 nnkAccQuoted.newTree( newIdentNode("type") )
               )
  let nCat = nCategories-1
  result = quote do:
      type
        `modelInstance` = ref object
            r*:          array[`numberOfReals`, fmi2Real]
            i*:          array[`numberOfIntegers`, ptr int] #fmi2Integer]
            b*:          array[`numberOfBooleans`, fmi2Boolean]
            s*:          array[`numberOfStrings`, fmi2String]
            isPositive*: array[`numberOfEventIndicators`, fmi2Boolean]
            time*: fmi2Real
            instanceName*: fmi2String
            `mytype`: fmi2Type
            GUID*: fmi2String
            functions*: fmi2CallbackFunctions  #ptr fmi2CallbackFunctions  # <-----
            loggingOn*: fmi2Boolean
            logCategories*: array[`nCat`, fmi2Boolean]
            componentEnvironment*: fmi2ComponentEnvironment
            state*: ModelState
            eventInfo*: fmi2EventInfo
            isDirtyValues*: fmi2Boolean
            isNewEventIteration*: fmi2Boolean

  #echo result.repr
