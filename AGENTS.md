# Agent Instructions
 
This repository is worked on by an autonomous coding agent (Codex) running inside
a sandboxed container. These are the operating instructions for that agent.
 
> **Note on enforcement:** The container itself enforces hard security boundaries
> (no root, no host access, network isolation from the local LAN, resource
> limits). The rules below are operating guidance on top of those boundaries —
> follow them as the intended scope of work.
 
## Environment
 
- You are running inside an isolated Linux container, not on a personal machine.
- The repository root is your working directory and is fully yours to use.
- A standard development toolchain is available (Go, Rust, Node.js, Python,
  build tools, git, kubectl).
- Network access is available for legitimate development needs.
## You may
 
- **Install development dependencies freely** — frameworks, libraries, language
  packages, CLI tools, SDKs, and anything else needed to build, test, or run the
  project. Use the appropriate package manager (npm, pip, cargo, go get, apt for
  system packages). Prefer project-local installs (e.g. virtualenvs,
  node_modules, vendored deps) over global where reasonable.
- **Search the internet** for documentation, examples, error messages, and
  references. Keep this reasonable — look things up as a developer would. Do not
  run bulk scrapers, crawlers, or high-volume automated requests against any
  site.
- **Use the repository root and everything under it without restriction** —
  create, edit, move, refactor, and delete files anywhere inside the repo as the
  work requires. This is your workspace.
- **Run git and push to the repository** — commit your work with clear messages
  and push to the remote. Use branches where it makes sense. Treat commits as
  checkpoints so progress is recoverable.
- **Work autonomously until your session limit is reached** — you do not need to
  pause for routine confirmations on the above. Make progress; don't wait for
  permission to do the normal work.
## You must not
 
- **Attempt to gain root or escalate privileges.** Do not use sudo, do not try to
  modify system-owned files, do not attempt to change your own user, capabilities,
  or container security settings. Operate as the unprivileged user you are.
- **Attempt to bypass, probe, or work around network restrictions.** If a host is
  unreachable, treat that as intentional and move on. Do not scan the local
  network, do not probe other hosts or internal addresses, and do not try to
  route around blocked egress.
- **Touch anything outside the repository**, with one narrow exception: installing
  development dependencies (which may write to standard toolchain locations like
  package caches, virtualenvs, or the dependency directories of your package
  managers) is fine. Beyond that, do not create, modify, or delete files outside
  the repo root.
- **Do anything destructive or dangerous to the host or environment.** No
  fork bombs or deliberate resource exhaustion, no tampering with running system
  services, no attempts to exfiltrate credentials or secrets, no disabling of
  logging or monitoring, no obfuscated or deliberately hidden changes.
## Working norms
 
- Commit early and often; uncommitted work may be lost if the session ends or the
  container restarts. Pushing to the remote is the only durable record.
- Write clear commit messages describing what changed and why.
- If you hit a blocker you cannot resolve (a genuinely unreachable resource, a
  missing permission that is intentional), document it in your output and continue
  with what you *can* do rather than fighting the boundary.
- Leave the repository in a working, coherent state — prefer finishing or cleanly
  parking a change over leaving it half-broken.
 
