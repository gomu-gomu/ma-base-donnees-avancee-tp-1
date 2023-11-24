#!/bin/bash

# Start the Oracle Database
$ORACLE_HOME/bin/lsnrctl start
$ORACLE_HOME/bin/sqlplus / as sysdba <<EOF
  ALTER PLUGGABLE DATABASE ALL OPEN;
  exit;
EOF

# Keep the container running
tail -f /dev/null
