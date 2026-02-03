#!/bin/bash

set -e

# -------- CONFIG --------
GIT_URL="https://github.com/ChronicleOfTheSacredSword"

REPOS=(
    documentation
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

DOCKER_PATH="documentation/DOCKER_GLOBAL"
ENV_FILE=".env"

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

for repo in "${REPOS[@]}"; do
  if [[ "$repo" == "documentation" ]]; then
    continue
  fi

  if [ -d "$repo" ]; then
    echo "→ Initializing $repo"

    if [ -f "$ENV_FILE" ]; then
      cp "$ENV_FILE" "$repo/.env"
    else
      echo "⚠️  .env file not found, skipping copy"
    fi

    (
      cd "$repo"
      npm install
    )
  fi
done

echo ""
echo "✅ Done."
