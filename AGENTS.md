# Agent Instructions

Rules AI agents must follow when working in this repository.

---

## Commit messages

Use **Conventional Commits**.

### Header

* Format: `<type>(optional scope): summary`
* Use lowercase types (`feat`, `fix`, `ci`, `chore`, `docs`)
* Use scopes when relevant
* Write summaries in lowercase, imperative mood

### Body

* Leave a blank line after the header
* Explain **why**, not what
* Use imperative, present tense
* Wrap lines at ~72 characters

The body is optional for trivial changes.

---

## Release tags

* Use the bare version as the tag name — **no `v` prefix** (e.g. `1.0.0-beta.3`, not `v1.0.0-beta.3`)
* Tags must be annotated (`git tag -a`) with a structured release-notes message

---

## Commits (automation)

When generating commits via a shell:

* Do **not** pass generated messages directly to `git commit -m`
* Write the commit message to a file or standard input
* Use `git commit -F <file>` or `git commit -F -`
* Disable shell expansion when writing commit messages

This avoids issues with backticks, quotes, and other shell-expanded
characters in generated commit messages.

---

## Attribution

All commits must include an `Assisted-by` trailer line:

```
Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
```

* **AGENT_NAME** — the AI tool or framework used (e.g. `Claude`, `Cursor`, `Copilot`)
* **MODEL_VERSION** — the specific model version (e.g. `claude-opus-4-6`)
* **[TOOL1] [TOOL2]** — optional, space-separated list of specialized analysis tools used in the change (e.g. `coccinelle`, `sparse`, `smatch`, `clang-tidy`)
* Do **not** list everyday tools like `git`, `gcc`, `make`, or editors

Example:

```
Assisted-by: Claude:claude-opus-4-6 coccinelle sparse
```
---

