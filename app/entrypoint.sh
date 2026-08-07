#!/bin/sh
set -eu

if [ -n "${JDBC_URL:-}" ]; then
  database_config=$(printf '%s\n' "$JDBC_URL" | sed -n \
    's#^jdbc:oracle:thin:@//\([A-Za-z0-9.-][A-Za-z0-9.-]*\):\([0-9][0-9]*\)/\([A-Za-z0-9._-][A-Za-z0-9._-]*\)$#\1 \2 \3#p')

  if [ -z "$database_config" ]; then
    echo "JDBC_URL must have the format jdbc:oracle:thin:@//<host>:<port>/<service>" >&2
    exit 1
  fi

  set -- $database_config
  export KART_DB_HOST="$1"
  export KART_DB_PORT="$2"
  export KART_DB_DATABASE="$3"
  echo "Setting KART_DB variables: $KART_DB_HOST $KART_DB_PORT $KART_DB_DATABASE"
fi

mkdir -p /tmp/geoserver_data
cp -a /opt/geoserver_data/. /tmp/geoserver_data/

mkdir -p /tmp/tomcat
cp -a /usr/local/tomcat/. /tmp/tomcat/

exec /opt/startup.sh