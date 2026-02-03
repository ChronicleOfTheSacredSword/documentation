#!/bin/bash
set -e

# -------- CONFIG --------
REPOS=(
    user
    log
    auth
    mob
    heroes
    save
    map
    inventory
    classes
    ApplicationWeb
)
PID_DIR=".dev_pids"
mkdir -p "$PID_DIR"

# -------- FUNCTIONS --------

start_all() {
  echo "🚀 Starting dev servers..."
  for repo in "${REPOS[@]}"; do
    if [ -d "$repo" ]; then
      (
        cd "$repo"
        echo "Installing dependencies for $repo..."
        npm install

        echo "Starting $repo in background..."
        npm run dev > dev.log 2>&1 &
        PID=$!
        echo "$PID" > "../$PID_DIR/$repo.pid"
      )
      echo "→ $repo started in background"
    else
      echo "Repo $repo does not exist, skipping"
    fi
  done
  echo "All dev servers started"
}

stop_all() {
  echo "Stopping dev servers..."
  for pid_file in "$PID_DIR"/*.pid; do
    [ -f "$pid_file" ] || continue
    PID=$(cat "$pid_file")
    if kill -0 "$PID" 2>/dev/null; then
      kill "$PID"
      echo "→ Process $PID stopped"
    fi
    rm -f "$pid_file"
  done
  echo "All dev servers stopped"
}

# -------- MAIN --------
if [ "$1" == "--run" ]; then
  start_all
elif [ "$1" == "--stop" ]; then
  stop_all
else
  echo "Usage: $0 --run | --stop"
  exit 1
fi