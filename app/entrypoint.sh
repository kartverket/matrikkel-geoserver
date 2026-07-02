#!/bin/sh
set -x
set -e

mkdir -p /tmp/geoserver_data
cp -a /opt/geoserver_data/. /tmp/geoserver_data/

mkdir -p /tmp/tomcat
cp -a /usr/local/tomcat/. /tmp/tomcat/

exec /opt/startup.sh