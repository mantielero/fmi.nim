# Creating a FMU
In the folder `./fmusdk-master/fmu20/src/models/` there are different folders. For example, the `inc` folder. That folder has the appropriate strucuture with the XML description.

To create a Model Exchange FMU based on the `inc` information:
```
cd ./fmusdk-master/fmu20/src/models/
build_fmu me inc
```

This will create the file:
```
./fmusdk-master/fmu20/fmu/me/inc.fmu
```
# Creating one based on nim

Create the new library `inc.so` based in the nim version code by means of :
```
$ cd ../../../../
$ nim c --nimcache:.cache --app:lib -o:inc.so inc.nim
```
Move that library to the folder structure mentioned before and create again the FMU:
```
mv inc.so fmusdk-master/fmu20/src/models/inc/fmu/binaries/linux64/inc.so
cd ./fmusdk-master/fmu20/src/models/
build_fmu me inc
```

Now we can test that the model works by means of using
```
fmusdk-master/fmu20/bin/fmusim_me inc_new.fmu 10.0 0.1
```


