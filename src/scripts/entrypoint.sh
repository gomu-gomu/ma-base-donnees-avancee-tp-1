#!/bin/bash

# Print listener status for debugging
$ORACLE_HOME/bin/lsnrctl start

# Connect with SQL*Plus
# $ORACLE_HOME/bin/sqlplus / as sysdba <<EOF
# $ORACLE_HOME/bin/sqlplus sys/very_STRONG_p055w0rd@pdb3 as sysdba <<EOF
#   SELECT * FROM all_tables WHERE ROWNUM <= 2;
#   exit;
# EOF

# Keep the container running
# tail -f /dev/null
$ORACLE_HOME/bin/sqlplus sys/very_STRONG_p055w0rd@pdb3 as sysdba