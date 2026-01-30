# The Forge Protocol: Operational Strategy & Onboarding

## 1. Mission Overview
The Forge Protocol is a strategy for scaling AI Automation Consulting through **Specialized Digital Colleagues**. Each colleague is a high-performance OpenClaw unit dedicated to a specific client project, ensuring data isolation and specialized focus while sharing a common DNA.

## 2. The Core Stack (Standard Issue)
Every colleague is equipped with the same standard loadout:
- **Brain:** OpenClaw (Node.js runtime) on GCE (AMD Genoa architecture).
- **Inbound Comms:** Slack (Direct Messaging + Project Channels).
- **Outbound Comms:** GitHub (Code & Strategy) + Vercel (POC Deployments).
- **Memory/Data:** MongoDB Atlas (State & Mock Data).
- **Logic:** n8n (Workflow Automation).
- **Skills:** Homebrew, Terraform, GCloud SDK.

## 3. Specialist Role: The Sandboxing Specialist
Your primary tactical advantage is the ability to **simulate reality**.
- **The Bottleneck:** Testing n8n workflows against live/legacy APIs is slow and high-risk.
- **The Solution:** Bali (and subsequent colleagues) build local mock environments. 
- **The Workflow:** 
  1. Analyze client API docs. 
  2. Provision a local Express mock server. 
  3. Generate synthetic edge-case data in MongoDB. 
  4. Point n8n at the mock. 
  5. Validate logic offline. 
  6. Promote to production by swapping URLs.

## 4. Scaling Strategy: DNA Replication
We do not clone virtual machines. We **replicate the DNA**.
- **DNA Repository:** The `forge-clawd/agent-blueprint` repo contains the "Golden Image" in `/dna`.
- **Provisioning:** Use Terraform to spin up fresh GCE instances (c3d-standard-4).
- **Bootstrapping:** A one-line shell command pulls the DNA, installs dependencies, and initializes the new colleague.

## 5. Security Doctrine
- **Zero Exposure:** API keys and secrets stay in `.env`. They are never committed to Git or printed in chat transcripts.
- **Isolation:** Each project gets its own VM and its own `.env` to prevent cross-contamination.

## 8. Tactical Doctrines

### Doctrine A: "The Arsenal" (Modular Functionality)
- **Strategy:** Provide the weapons (Atomic Tools); the client is the soldier (Decision Maker).
- **n8n Role:** Function-as-a-Service (e.g., "Create Item," "Update Vendor").
- **Bali's Edge:** Expose these via MCP. Bridges the gap between manual processes (Excel) and structured ERPs.
- **Goal:** Phase 1 deployment to establish tools and discover SOPs.

### Doctrine B: "The Machine" (Autonomous Systems)
- **Strategy:** Build the factory; the client monitors the dashboard.
- **n8n Role:** Autonomous Agent / End-to-end logic.
- **Bali's Edge:** Chaos Mode testing ensures self-healing and resilience.
- **Goal:** Phase 2 deployment—turning discovered SOPs into high-volume automation.

## 10. Core Assets & Repository Map

- **Rebuild DNA:** `forge-clawd/agent-blueprint` (Branch: `main`)
  - Location: `/dna` (Golden image for AGENTS, SOUL, USER, IDENTITY).
  - Infrastructure: `/infra` (Terraform definitions for GCE provisioning).
  - Bootstrap: `bootstrap.sh` (One-line dependency installer).

- **Mock POC Sandbox:** `forge-clawd/mock-crm-poc`
  - URL: <https://mock-crm-poc.vercel.app>
  - App: Next.js 15 (Contacts, Deals, Live Activity sidebar).
  - Features: Chaos Mode Toggle (random 500/429/504 errors), Global Data Reset (`/api/reset`).

## 11. Command & Control SOPs

### Provisioning a New Colleague
1. Run Terraform apply to create VM (Machine: `c3d-standard-4`).
2. Execute `bootstrap.sh` via startup script.
3. Inject project-specific `.env` from local encrypted storage.
4. Verify Slack connectivity via manual mention.

### Executing a Sandbox Validation
1. Enable **Chaos Mode** for resilience testing.
2. Use the **Mirror Technique** with client JSON samples.
3. Build n8n logic against the Mock URL.
4. Generate **Proof of Life** report for client sign-off.
