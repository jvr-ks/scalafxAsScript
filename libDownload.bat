@rem libDownload.bat

@rem https://repo1.maven.org/maven2/org/scalafx/
@rem Check Scala-version! (16.0.0-R25 as of 2021-09-17)


@rem https://repo1.maven.org/maven2/org/openjfx
@rem Check openjfx-version matching the Scala-version (16-ea+7 as of 2021-02-11)


@rem Compare Version-numbers!

@rem uses wget, 
@rem download with MSYS2 from: https://www.msys2.org/


@echo off

cd %~dp0

set osType=win

rem Version-numbers:
set javaFXVersion=16-ea+7

set ScalaVersion=2.13
set ScalaFXVersion=16.0.0-R25



set libDIR=lib
IF not exist %libDIR% (mkdir %libDIR%)

cd lib

del /F /Q *.*

rem ScalaFX:
C:\msys64\usr\bin\wget.exe -nc https://repo1.maven.org/maven2/org/scalafx/scalafx_%ScalaVersion%/%ScalaFXVersion%/scalafx_%ScalaVersion%-%ScalaFXVersion%.jar

rem base:
C:\msys64\usr\bin\wget.exe -nc https://repo1.maven.org/maven2/org/openjfx/javafx-base/%javaFXVersion%/javafx-base-%javaFXVersion%-%osType%.jar 
C:\msys64\usr\bin\wget.exe -nc https://repo1.maven.org/maven2/org/openjfx/javafx-base/%javaFXVersion%/javafx-base-%javaFXVersion%-sources.jar

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












