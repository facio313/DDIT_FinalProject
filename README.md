# DDIT Final Project

The repository preserves the original Java 8 / Spring MVC team project and its deliverables.

## Public deployment

`https://bonifacio.work/ddit-finalproject/` serves an honest, read-only static portfolio archive.
It does not run the legacy WAR or connect to Oracle, Gmail SMTP, payment, or WebSocket services.
The archive uses only assets already contained in this repository.

A push to `main` builds a native ARM64 nginx image, publishes the immutable commit-SHA tag to
GHCR, and requests only `deploy ddit-finalproject <40-character-sha>` through the restricted
deployment key. The app binds to loopback port `5179` and does not create or join a database network.
