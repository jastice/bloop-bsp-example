#! /bin/sh
# coursier launch ch.epfl.scala:bloop-launcher_2.12:1.3.2 -- 1.3.2
ROOTDIR=`pwd`

LIBS="org.scala-lang:scala-library:2.13.0"
JARS=$(bin/coursier fetch -r sonatype:releases $LIBS)
CLASSPATH=$(echo $JARS | sed -e s/[[:blank:]]/\",\"/g)

COMPILER_LIBS="org.scala-lang:scala-library:2.13.0 org.scala-lang:scala-compiler:2.13.0 org.scala-lang:scala-reflect:2.13.0"
COMPILER_JARS=$(bin/coursier fetch -r sonatype:releases $COMPILER_LIBS)
COMPILER_CLASSPATH=$(echo $COMPILER_JARS | sed -e s/[[:blank:]]/\",\"/g)

sed "s#\$ROOT#$ROOTDIR#;s#\$CLASSPATH#$CLASSPATH#;s#\$COMPILER_CLASSPATH#$COMPILER_CLASSPATH#" etc/build.json > .bloop/build.json

# coursier launch ch.epfl.scala:bloop-launcher_2.12:1.3.2 -- 1.3.2