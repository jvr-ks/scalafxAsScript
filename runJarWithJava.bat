@rem runJarWithJava.bat
@rem first run "make_jar.bat"
@rem Path to Scala-lib ("C:\\shared\\scala-2.13.6\\lib\\") must be set manually!



@call java -cp "C:\\shared\\scala-2.13.6\\lib\\*;scalafxTest.jar;lib\\*"  Test

@pause