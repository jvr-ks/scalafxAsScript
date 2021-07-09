@rem runAsScalaScript.bat

@call scala -cp "lib\\*" scalafxTest.ssc
@rem call scala -savecompiled -cp "lib\\*" scalafxTest.ssc

@pause