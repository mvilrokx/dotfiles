# Code Quality
- Prefer simple, readable code over clever solutions
- Duplication is acceptable if it improves clarity - avoid premature abstraction
- Code should be self-documenting; only comment the "why", not the "what"
- Fail fast and loud - don't silently swallow errors
- Don't add defensive checks for impossible cases

# Scope
- Only change what's necessary - don't refactor surrounding code unless asked
- Don't add features or improvements I didn't request

# Communication
- Be concise - skip lengthy explanations unless asked
- Make reasonable assumptions rather than asking many questions

# Workflow
- Practice TDD: write tests first, then implement
- Run tests after making changes
- Prefer running single tests over the whole suite

# UI Changes
- Always verify UI changes visually using browser tools (Playwright, Chrome DevTools MCP)
- Take screenshots to validate the result matches expectations

# Git
- Use conventional commits (feat:, fix:, docs:, refactor:, test:, chore:)
- Keep commits small and focused

# Security
- Never hardcode secrets, credentials, or API keys
- Validate input at system boundaries (user input, external APIs)
- Be mindful of common vulnerabilities (injection, XSS, etc.)
