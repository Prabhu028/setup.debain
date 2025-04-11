#!/bin/bash

# Load variables from /etc/wildfly/wildfly.conf
. /etc/wildfly/wildfly.conf

if [ -z "$WILDFLY_HOME" ]; then
    WILDFLY_HOME="/opt/wildfly"
fi

if [[ "$WILDFLY_MODE" == "domain" ]]; then
    exec "$WILDFLY_HOME/bin/domain.sh" -c "$WILDFLY_CONFIG" -b "$WILDFLY_BIND" -bmanagement "$WILDFLY_BIND"
else
    exec "$WILDFLY_HOME/bin/standalone.sh" -c "$WILDFLY_CONFIG" -b "$WILDFLY_BIND" -bmanagement "$WILDFLY_BIND"
fi
