# scalaFXAsScript 
    
##### Description   
  
I tried to run ScalaFX as Scalascript (without a build-tool).  
  
Because there is no builtool, the FX libraries must be available in the "lib" subdirectory.  
Take a look at "libDownload.bat" (Windows only).

Used Scala-version: 2.13  
Used Java-version: 11,17 (openjdk/GraalVM)  (not Java 8!)  
  
(Use [Selsca](https://github.com/jvr-ks/selsca) to select Scala-version).  
(Use [Selja](https://github.com/jvr-ks/selja) to select Java-version).  
  
Batchfile | Action  | comment
------------ | ------------- | ------------- 
runAsScalaScript.bat | runs scalafxTest.ssc as ScalaScript | optionally use -savecompiled switch   
make_jar.bat | compiles Test to jar-file scalafxTest.jar  
runJarWithScala.bat | runs the previously compiled Test (jar-file) as Scala  
runJarWithjava.bat | runs the previously compiled Test (jar-file) as Java | needs access to additional Scala-libraries  
  
I wonder how to set the correct classpath:  
  
ok:  
`as Scala-script: scala -cp "lib\\*" scalafxTest.ssc`  
`as Scala-script: scala -cp "lib\*" scalafxTest.ssc`  
    
`as Scala: scala -cp scalafxTest.jar;lib\* Test`  
`as Scala: scala -cp "scalafxTest.jar;lib\*" Test`  
  
  
`as Java: java -cp "C:\\shared\\scala-2.13.6\\lib\\*;scalafxTest.jar;lib\\*"  Test`  
`as Java: java -cp "C:/shared/scala-2.13.6/lib/*;scalafxTest.jar;lib/*"  Test`  
`as Java: java -cp "C:\\shared\\scala-2.13.6\\lib\\*";scalafxTest.jar;lib\\*  Test`  
`as Java: java -cp "C:\\shared\\scala-2.13.6\\lib\\*";scalafxTest.jar;lib\*  Test`  
`as Java: java -cp "C:\\shared\\scala-2.13.6\\lib\\*";scalafxTest.jar;lib/*  Test`  
  
**not ok:  **  
`as as Scala-script: scala -cp lib\* scalafxTest.ssc`  
`as as Scala-script: scala -cp lib/* scalafxTest.ssc`  
`as as Scala-script: scala -cp "lib/*" scalafxTest.ssc`  
`as as Scala-script: scala -cp 'lib/*' scalafxTest.ssc`  
`as as Scala-script: scala -cp 'lib\*' scalafxTest.ssc`  
  
`as Scala: scala -cp "scalafxTest.jar;lib/*" Test`  
  
`as Java: java -cp 'C:/shared/scala-2.13.6/lib/*;scalafxTest.jar;lib/*'  Test` 
  

##### Status  
usable.  

Version (>=)| Change
------------ | -------------
0.004 | Using JFXApp3 (JFXApp is deprecated)
  
#### Known issues / bugs 
Issue / Bug | Type | fixed in version
------------ | ------------- | -------------
WARNING: Unsupported JavaFX configuration: classes were loaded from 'unnamed module @...' | issue | JavaFX is not on the module-path but on the classpath

  
##### Requirements  
* Windows 10 build 17063 or later.  
* Scala installed (not only SBT), take a look at "scalaDownload.bat"  
  
##### Sourcecode  
Github URL [github](https://github.com/jvr-ks/scalafxAsScript).  
  
##### License: MIT  
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sub-license, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANT-ABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2020 J. v. Roos
 
