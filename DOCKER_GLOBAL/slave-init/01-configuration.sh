#!/bin/bash
set -e

echo "Waiting for master..."
until pg_isready -h master-pg -U postgres; do
  sleep 2
done

echo "Stopping postgres..."
pg_ctl -D "$PGDATA" -m fast -w stop || true

echo "Cloning master..."
rm -rf "$PGDATA"/*
PGPASSWORD=postgres pg_basebackup \
  -h master-pg \
  -D "$PGDATA" \
  -U postgres \
  -Fp -Xs -P -R

echo "Replica initialized"
