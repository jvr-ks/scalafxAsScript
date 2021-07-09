@rem libDownload.bat
@rem https://repo1.maven.org/maven2/org/openjfx
@rem https://repo1.maven.org/maven2/org/scalafx/

@rem Check Scala-version!
@rem Compare Version-numbers!

@rem uses wget, 
@rem download with MSYS2 from: https://www.msys2.org/


@echo off

set osType=win

rem Version-numbers:
set javaFXVersion=17-ea+14
set javaFXOldVersion=16-ea+5

set ScalaVersion=2.13
set ScalaFXVersion=16.0.0-R24
set ScalaFXOldVersion=16.0.0-R23
@rem 

cd %~dp0

set libDIR=lib
IF not exist %libDIR% (mkdir %libDIR%)

cd lib


rem ScalaFX:
C:\msys64\usr\bin\wget.exe -nc https://repo1.maven.org/maven2/org/scalafx/scalafx_%ScalaVersion%/%ScalaFXVersion%/scalafx_%ScalaVersion%-%ScalaFXVersion%.jar

rem base:
C:\msys64\usr\bin\wget.exe -nc https://repo1.maven.org/maven2/org/openjfx/javafx-base/%javaFXVersion%/javafx-base-%javaFXVersion%-%osType%.jar 

rem graphics:
C:\msys64\usr\bin\wget.exe -nc https://repo1.maven.org/maven2/org/openjfx/javafx-graphics/%javaFXVersion%/javafx-graphics-%javaFXVersion%-%osType%.jar 

rem controls:
C:\msys64\usr\bin\wget.exe -nc https://repo1.maven.org/maven2/org/openjfx/javafx-controls/%javaFXVersion%/javafx-controls-%javaFXVersion%-%osType%.jar

rem media:
C:\msys64\usr\bin\wget.exe -nc https://repo1.maven.org/maven2/org/openjfx/javafx-media/%javaFXVersion%/javafx-media-%javaFXVersion%-%osType%.jar

rem fxml:
C:\msys64\usr\bin\wget.exe -nc https://repo1.maven.org/maven2/org/openjfx/javafx-fxml/%javaFXVersion%/javafx-fxml-%javaFXVersion%-%osType%.jar

rem web:
C:\msys64\usr\bin\wget.exe -nc https://repo1.maven.org/maven2/org/openjfx/javafx-web/%javaFXVersion%/javafx-web-%javaFXVersion%-%osType%.jar



rem comment out following exit command to remove old *.jar:
exit

rem Delete old *.jar
del javafx-*-%javaFXOldVersion%-%osType%.jar 

del javafx-*-%ScalaFXOldVersion%-%osType%.jar









