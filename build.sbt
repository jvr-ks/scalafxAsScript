//--------------------------------- build.sbt ---------------------------------
// Java 11
// set JAVAFX_LIB first!
// use runSBT.bat
// https://repo1.maven.org/maven2/org/openjfx

ThisBuild / scalaVersion := "2.12.8"
ThisBuild / version := "0.0.1"


// https://www.reddit.com/r/scala/comments/9fbzbk/build_file_snippet_for_using_javafx_with_java_11/
// https://gluonhq.com/products/javafx/

val osType: SettingKey[String] = SettingKey[String]("osType")

import scala.util.Properties
osType := {
	if (Properties.isLinux)
		"linux"
	else if (Properties.isMac)
		"mac"
	else if (Properties.isWin)
		"win"
	else
		throw new Exception(s"unknown os: ${Properties.osName}")
}

val javafxLib = file(sys.env.get("JAVAFX_LIB").getOrElse("Environmental variable JAVAFX_LIB is not set"))

lazy val root = (project in file("."))
	.settings(
		name := "openjfx-sbt",
		libraryDependencies ++= Seq(
			"org.scalafx" 								%% "scalafx" 						% "latest.integration",
			"com.github.pathikrit"				%% "better-files"				% "latest.integration",
			"com.lihaoyi"									%% "utest"							% "0.7.7"								% Test
		),

		// scala-2.12.8: invoke javac directly since scalac does not yet support module syntax
		// without --module-path, "error: module not found: javafx.controls" occurs on "requires javafx.controls"
		Compile / unmanagedSourceDirectories -= (Compile / javaSource).value,
		Compile / compile := {
			val analysis = (Compile / compile).value
			val command = s"javac -d ${(Compile / classDirectory).value} --module-path $javafxLib ${((Compile / javaSource).value ** "*.java").get.mkString(" ")}"
			println(s"executing: $command")
			import scala.sys.process._
			command.!
			analysis
		},

		// JavaFX 11 jars are modules and cannot be embedded in the fat jar
		// The fat jar is still built to embed the scala-library jar
		assemblyExcludedJars in assembly := (fullClasspath in assembly).value.filter(_.data.getName.startsWith("javafx-")),
	)
	