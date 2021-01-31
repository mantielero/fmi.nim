# FMI - Introducción
[https://fmi-standard.org/](https://fmi-standard.org/)
[FMI version 2.0 Spec](https://fmi-standard.org/docs/2.0.1-develop/)

https://github.com/qtronic/fmusdk

Hay dos modos:
* Model exchange: el solver es el del entorno de ejecución.
* Co-simulación: el solver está incluido en el FMU.
## Descripción
Un FMU es un zip que incluye:
* La descripción en XML
* Código C
* Datos adicionales
## Elementos comunes a model exchange  y cosimulacion
Hay 3 header que definen la API con un FMU. Todas las funciones y tipos comienzan con **fmi2**.

Threeheader files are provided that define the interfaceof an FMU. In allheader files the convention is used that all C functionand type definitions start with the prefix “fmi2”:
* [fmi2TypesPlatform.h](https://github.com/qtronic/fmusdk/blob/v2.0.6/fmu20/src/shared/include/fmi2TypesPlatform.h): contiene las definicions de tipo de los arguentos de las funciones.
*  [fmi2FunctionTypes.h](https://github.com/qtronic/fmusdk/blob/v2.0.6/fmu20/src/shared/include/fmi2FunctionTypes.h):  contiene las definiciones de los todos los prototipos de funciones de un FMU.
* [fmi2Functions.h](https://github.com/qtronic/fmusdk/blob/v2.0.6/fmu20/src/shared/include/fmi2Functions.h): contains the function prototypes of an FMU that can be accessed in simulation environments and that are defined in chapters 2, 3, and 4. Este fichero incluye los dos anteriores. Una de las cosas que incluye es una macro que cambia el nombre de las funciones para evitar clashes.

Para evitar los clashes, los ficheros e C que definen un FMU deberán incorporar un define: **FMI2_FUNCTION_PREFIX**.

Si se manda el código fuente o se usan librerías estáticas, cambiará el nombre de las funciones. Si son lbrerías dinámicas, no se hará.
