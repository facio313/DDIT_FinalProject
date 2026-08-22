# DDIT Final Project

The repository preserves the original Java 8 / Spring MVC team project and its deliverables.

## Public deployment

`https://bonifacio.work/ddit-finalproject/` serves an honest, read-only static portfolio archive.
It does not run the legacy WAR or connect to Oracle, Gmail SMTP, payment, or WebSocket services.
The archive uses only assets already contained in this repository.

All portfolio repositories use the same authentication environment contract. `main` and `dev`
resolve to `PORTFOLIO_AUTH_MODE=sso` and are served through the Bonifacio SSO edge. Every other
branch resolves to `local`, so its loopback-bound archive can be opened directly during development.
An explicitly supplied mode that disagrees with the branch fails closed.

To build the local branch from the repository root:

```bash
export PORTFOLIO_BRANCH="$(git branch --show-current)"
export PORTFOLIO_AUTH_MODE="$(scripts/portfolio-auth-mode.sh print)"
docker compose build
```

Pushes to `main` and `dev` build native ARM64 nginx images with their resolved auth metadata and
publish immutable commit-SHA tags. Only `main` also publishes `latest` and requests
`deploy ddit-finalproject <40-character-sha>` through the restricted deployment key. The app binds
to loopback port `5179` and does not create or join a database network.
