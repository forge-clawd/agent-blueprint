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

## 6. Onboarding New Colleagues
To activate a new colleague:
1. Provision GCE via Terraform.
2. Run `bootstrap.sh`.
3. Inject project-specific `.env`.
4. Approve the Slack pairing code.
5. Report for duty.
