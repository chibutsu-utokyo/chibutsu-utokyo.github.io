# AGENTS.md

## Repository Overview

- This repository hosts the MkDocs source for https://chibutsu-utokyo.github.io/.
- Main content lives in `docs/`.
- Site configuration lives in `mkdocs.yml`.
- Python dependencies are managed with `uv` via `pyproject.toml` and `uv.lock`.
- The intended Python version is `3.11.9` from `.python-version`.

## Setup

Use these commands for a local checkout:

```sh
uv python install 3.11.9
uv sync
```

Run MkDocs through `uv`:

```sh
uv run python sanitize.py
uv run mkdocs serve
uv run mkdocs build
```

- Run `uv run python sanitize.py` before building or deploying when Markdown punctuation normalization is needed.

## Devcontainer

- The devcontainer uses `mcr.microsoft.com/devcontainers/universal:2.13.1-focal`.
- `.devcontainer/postCreateCommand.sh` installs `uv` if needed and runs `uv sync`.
- Keep local and devcontainer dependency management aligned through `uv`.

## Deployment

- Pushing to `main` triggers `.github/workflows/deploy.yml`.
- The workflow runs `uv sync --frozen`, `uv run python sanitize.py`, and `uv run mkdocs gh-deploy --force`.
- Manual deployment is still possible with `uv run mkdocs gh-deploy`.

## Editing Guidance

- Edit pages under `docs/` unless the task is about site configuration.
- When adding or renaming pages, update the `nav:` section in `mkdocs.yml`.
- Do not edit generated files in `site/` by hand.
- Prefer minimal, targeted edits that preserve the existing writing style.

## Git Guidance

- Write git commit messages in English to match the existing history.

## Verification

- For content or config changes, run `uv run mkdocs build`.
- Run `uv run python sanitize.py` if you need to normalize Markdown punctuation before verification.
- Treat MkDocs warnings as worth checking, especially missing `nav` entries or broken links.
