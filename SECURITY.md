# Security policy

## Reporting a vulnerability

Email **security@respira.press** with the issue and a way to reproduce it. You should expect an acknowledgement within 48 hours and a status update within five business days.

Please do not file public GitHub issues for vulnerabilities.

## Scope

This security policy covers:

- The MCP server published to npm as `@respira/wordpress-mcp-server` (the wrapper exposed by this repo). Source: open, MIT-licensed.
- The **Respira for WordPress** plugin's REST API surface (`/wp-json/respira/v1/*`, `/wp-json/respira/v2/*`, `/wp-json/webmcp/v1/*`). Source: closed, commercial license.
- The Respira account / billing surfaces hosted at `https://www.respira.press` (signup, login, dashboard, billing, license issuance).

Out of scope: third-party MCP directories (Glama, Smithery, MCP Registry) — please report issues with those listings to the directory operators directly.

## Architecture & trust model

The MCP server in this repo is a thin wrapper. **License validation, business logic, and per-site permission gating all live in the WordPress plugin.** That separation is intentional:

- The npm package is MIT and contains no license-validation logic. Anyone can read, fork, or vendor it.
- The plugin (1000+ PHP files, not open source) enforces the API key check on every write-capable REST route. It also runs the snapshot/duplicate-first safety, builder intelligence, and governance.
- Without a valid Respira API key bound to an active license, the plugin's write surface is closed. Read-only schema endpoints (`/divi/modules/<slug>/schema`, `/server/compatibility`) are intentionally anonymous so AI agents can introspect what they're working with before authentication.

So if you find a way to make the npm package do something it shouldn't on its own — that's an MCP-server bug. If you find a way to bypass the plugin's API-key gate — that's a plugin bug, and far higher severity.

## Telemetry the package sends

The npm package emits **anonymous crash reports to Sentry** at startup and on unhandled errors. The DSN is embedded in the build (Sentry treats DSNs as public-by-design — they're how the SDK reaches the project). No customer data, no API keys, no site URLs are sent — only stack traces, Node version, OS, and the agent client identifier (Claude Code, Cursor, etc.).

To disable, set `RESPIRA_MCP_DISABLE_UPDATE_CHECK=1` or run with `--no-telemetry` (configurable via the env var).

## What the package contains

Inspect what `npx -y @respira/wordpress-mcp-server` actually downloads:

```bash
npm pack @respira/wordpress-mcp-server
tar -tzf respira-wordpress-mcp-server-*.tgz
```

Should show: `package/README.md`, `package/icon.png`, `package/package.json`, `package/dist/**` (compiled JS + sourcemaps + d.ts). No build scripts, no postinstall hooks, no native binaries.

## Supported versions

| Version line | Status | Security fixes |
|---|---|---|
| 6.11.x | Current | Active |
| 6.10.x | Older minor | Critical only |
| ≤ 6.9.x | End of life | Upgrade |

The plugin and MCP server version together — the `respira_get_server_compatibility` tool returns the supported MCP version range. Mismatches surface a stderr warning at startup.

## Coordinated disclosure

If your report results in a CVE, we'll credit you in the release notes unless you ask us not to. Bounty: not currently offered, but we send a thank-you and Respira credit (free year on the plan of your choice) for vulnerabilities affecting the plugin's auth gate or the npm package's runtime safety.
