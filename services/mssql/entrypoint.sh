#!/bin/bash
set -e

/opt/mssql/bin/sqlservr &
MSSQL_PID=$!

echo "Waiting for SQL Server to be ready..."
until /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -Q "SELECT 1" -C -b &>/dev/null; do
  sleep 1
done
echo "SQL Server is ready. Running init scripts..."

for f in /init-sql/*.sql; do
  [ -e "$f" ] || continue
  echo "Running $f"
  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -d master -i "$f" -C
done

echo "Init complete."
wait $MSSQL_PID
