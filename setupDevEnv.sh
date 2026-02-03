#!/bin/bash

set -e

# -------- CONFIG --------
GIT_URL="https://github.com/ChronicleOfTheSacredSword"

REPOS=(
  documentation
  user
  auth
  log
  save
  heroes
  inventory
  mob
  map
  classes
  ApplicationWeb
)

DOCKER_PATH="documentation/DOCKER_GLOBAL"
ENV_FILE=".env"
BASE_PORT=5000
# ------------------------

echo "🔄 Clone or pull repositories"
for repo in "${REPOS[@]}"; do
  if [ -d "$repo/.git" ]; then
    echo "→ Pulling $repo"
    (cd "$repo" && git pull)
  else
    echo "→ Cloning $repo"
    git clone "$GIT_URL/$repo.git"
  fi
done

#echo ""
#echo "🐳 Removing all Docker containers"
#docker rm -f $(docker ps -aq) 2>/dev/null || true

echo ""
echo "🐳 Running docker compose in documentation"
if [ -d "$DOCKER_PATH" ]; then
  (cd "$DOCKER_PATH" && docker compose up -d)
else
  echo "❌ Docker path not found: $DOCKER_PATH"
  exit 1
fi

echo ""
echo "⏳ Waiting 10 seconds for containers to start..."
sleep 10

echo ""
echo "🚀 Initializing projects"

INDEX=0
for repo in "${REPOS[@]}"; do
  if [[ "$repo" == "documentation" ]]; then
    continue
  fi

  PORT=$((BASE_PORT + INDEX))

  if [ -d "$repo" ]; then
    echo "→ Initializing $repo (PORT=$PORT)"

    if [ -f "$ENV_FILE" ]; then
      cp "$ENV_FILE" "$repo/.env"

      # Remove existing PORT if present
      sed -i '/^PORT=/d' "$repo/.env"

      # Append PORT
      echo "" >> "$repo/.env"
      echo "# Auto-generated port" >> "$repo/.env"
      echo "PORT=$PORT" >> "$repo/.env"
    else
      echo "⚠️  .env file not found, skipping copy"
    fi

    (
      cd "$repo"
      npm install
    )
  fi

  INDEX=$((INDEX + 1))
done

echo ""
echo "✅ Done."
