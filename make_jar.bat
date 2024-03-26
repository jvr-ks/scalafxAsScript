@rem make_jar.bat


@call scalac -deprecation -classpath $SCALA_HOME\lib\*;lib\* scalafxTest.scala -d scalafxTest.jar


@pause


