# Use Oracle Linux 7 as the base image
FROM oraclelinux:7-slim

# Set environment variables
ENV ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
ENV PATH=$ORACLE_HOME/bin:$PATH
ENV ORACLE_SID=ORACLE
ENV ORACLE_PDB=ORACLE_PDB
ENV ORACLE_VERSION=19.3.0.0
ENV ORACLE_PASSWORD=very_STRONG_p055w0rd

# Copy the Oracle Database installation files to the container
COPY ./bin /tmp/oracle-database

# Install required packages
RUN ORACLE_DOCKER_INSTALL=true yum -y install /tmp/oracle-database/*.rpm \
    && rm -rf /tmp/oracle-database

# Copy the database configuration script
COPY ./scripts/db_install.rsp /opt/oracle/db_install.rsp
COPY ./scripts/entrypoint.sh /entrypoint.sh

# Granting permissions
RUN usermod -aG wheel oracle

# Assigning ownership
RUN chmod +x /entrypoint.sh
RUN mkdir -p /u01/app/oracle/oradata && chown -R oracle:wheel /u01/app/oracle/oradata

# Switch to the oracle user
USER oracle

# Create the database
RUN dbca -silent -createDatabase -responseFile "/opt/oracle/db_install.rsp"

# Expose Oracle listener port
EXPOSE 1521

ENTRYPOINT ["/entrypoint.sh"]