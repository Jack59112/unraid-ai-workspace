# Unraid AI Workspace

Docker workspace for running an AI-assisted administration environment on Unraid.

This repository is structured for Unraid Community Applications publication.

## Features

- Web terminal through `ttyd`.
- OpenAI Codex CLI installed with `npm`.
- Persistent configuration in `/config`.
- Persistent workspace in `/workspace`.
- Optional SSH service.
- Conservative Unraid template by default.

## Quick Start

```bash
docker run -d \
  --name unraid-ai-workspace \
  -p 8088:8088 \
  -e TZ=Europe/Paris \
  -e WEB_PASSWORD=change-me \
  -e OPENAI_API_KEY=sk-... \
  -v /mnt/user/appdata/unraid-ai-workspace:/config \
  -v /mnt/user/work_chatgpt:/workspace \
  -v /mnt/user:/unraid:ro \
  ghcr.io/jack59112/unraid-ai-workspace:latest
```
