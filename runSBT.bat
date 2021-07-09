@rem runSBT.bat


@echo off

cd %~dp0

set JAVAFX_LIB=lib/

call lib/libDownload.bat


cd %~dp0


call sbt run


pause









