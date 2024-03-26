@rem javaFXlibDownload.bat
@rem https://repo1.maven.org/maven2/org/openjfx

@rem Compare Version-numbers!

@rem uses wget, 
@rem download with MSYS2 from: https://www.msys2.org/


@echo off

set osType=win

rem Version-numbers:
set javaFXVersion=17.0.1
set javaFXOldVersion=17-ea+14


cd %~dp0

set libDIR=lib
IF not exist %libDIR% (mkdir %libDIR%)

cd lib

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










