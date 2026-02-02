#!/bin/bash
set -e

echo "Configuring pg_hba.conf for replication..."

cat >> "$PGDATA/pg_hba.conf" <<EOF

# Allow replication connections from Docker network
host replication postgres 0.0.0.0/0 scram-sha-256
EOF
