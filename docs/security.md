# Security model

Default template is conservative:

- `/mnt/user` is mounted read-only at `/unraid`.
- Docker socket is not mounted by default.
- Secrets are supplied through Unraid template variables and are not stored in this repository.

Advanced users can add write mounts or Docker socket access manually if they accept the risk.
