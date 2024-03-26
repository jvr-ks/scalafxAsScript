@rem runJarWithScala.bat
@rem first run "make_jar.bat"

@call scala -cp scalafxTest.jar;lib\* Test

@pause