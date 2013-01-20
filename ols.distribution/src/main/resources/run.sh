#!/bin/sh

rem Simple check to see whether the "magic" Java binary is available on our path;
java -version 1>/dev/null 2>&1
if [ "$?" -ne "0" ]; then
  echo It appears that Java is not installed on this computer. You
  echo should download and install the latest JDK.
  exit 1
fi

# determine the location this script is run in (thanks Wayoda)
BASEDIR=$(dirname -- "${0}")
# all paths are used relatively from the base dir...
PLUGINDIR=$BASEDIR/plugins
CLASSPATH=$BASEDIR/bin/*
rem give the client roughly 1gigabyte of memory 
MEMSETTINGS=-Xmx1024m
rem <https://github.com/jawi/ols/issues/125>
SYSPROPS=-Djna.nosys=true -Dnl.lxtreme.ols.bundle.dir="$PLUGINDIR" -DPlastic.defaultTheme=SkyBluer

java $MEMSETTINGS $SYSPROPS -cp "$CLASSPATH" nl.lxtreme.ols.runner.Runner
