#!/bin/bash

# Agent Bootstrap Script (The "Soul Transfer")
# Usage: ./bootstrap.sh <agent-name>

AGENT_NAME=${1:-"NewAgent"}

echo "Initializing Agent: $AGENT_NAME..."

# 1. System Dependencies
echo "Installing System Dependencies..."
sudo apt-get update
sudo apt-get install -y git nodejs npm gh
sudo npm install -g pnpm clawdbot

# 2. Workspace Setup
mkdir -p ~/clawd/memory
cd ~/clawd

# 3. Pull Doctrine
echo "Applying Doctrine..."
cp ../agent-blueprint/templates/SOUL.md ./SOUL.md
cp ../agent-blueprint/templates/TOOLS.md ./TOOLS.md
cp ../agent-blueprint/templates/IDENTITY.md ./IDENTITY.md

# 4. Configure Identity
sed -i "s/{{NAME}}/$AGENT_NAME/g" IDENTITY.md

# 5. Install Skills (Standard Loadout)
echo "Equipping Skills..."
# (In a real scenario, we'd pull these from a registry or copy from local)
# clawdbot install skill github
# clawdbot install skill vercel
# clawdbot install skill n8n

echo "Agent $AGENT_NAME is ready for activation. Run 'clawdbot gateway' to start."
