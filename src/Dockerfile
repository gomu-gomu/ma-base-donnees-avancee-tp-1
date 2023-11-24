# Use Oracle Linux 7 as the base image
FROM oraclelinux:7-slim

# Set environment variables
ENV ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
ENV PATH=$ORACLE_HOME/bin:$PATH
ENV ORACLE_SID=MyOracleDB
ENV ORACLE_PDB=MyOraclePDB
ENV ORACLE_PASSWORD=password
ENV ORACLE_VERSION=19.3.0.0
ENV LISTENER_NAME=LISTENER
ENV LISTENER_PORT=1521

# Copy the Oracle Database installation files to the container
COPY ./bin /tmp/oracle-database

# Install required packages
RUN ORACLE_DOCKER_INSTALL=true yum -y install /tmp/oracle-database/*.rpm \
    && rm -rf /tmp/oracle-database

# Copy the database configuration script
COPY ./scripts/db_install.rsp /opt/oracle/db_install.rsp

# Ensuring the existence of distination folder
RUN mkdir -p $ORACLE_SID

# Switch to the oracle user
USER oracle

# Create the database
RUN dbca -silent -createDatabase \
 -templateName General_Purpose.dbc \
 -gdbname $ORACLE_SID -sid $ORACLE_SID -responseFile NO_VALUE \
 -characterSet AL32UTF8 \
 -sysPassword $ORACLE_PASSWORD \
 -systemPassword $ORACLE_PASSWORD \
 -createAsContainerDatabase true \
 -numberOfPDBs 1 \
 -pdbName pdb3 \
 -pdbAdminPassword $ORACLE_PASSWORD \
 -databaseType MULTIPURPOSE \
 -memoryMgmtType auto_sga \
 -totalMemory 1536 \
 -storageType FS \
 -datafileDestination "/u01/app/oracle/oradata/" \
 -redoLogFileSize 50 \
 -emConfiguration NONE \
 -ignorePreReqs

# Expose Oracle listener port
EXPOSE 1521

# Set up entry point script to start Oracle Database
COPY ./scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
