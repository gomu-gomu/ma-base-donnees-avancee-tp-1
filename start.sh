docker run --rm --name oracle19c -p 1521:1521 -p 5500:5500 -v "$(pwd)/src/db"/opt/oracle/oradata oracle/database:19.3.0-ee