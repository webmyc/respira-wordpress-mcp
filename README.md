<p align="center">
  <a href="https://respira.press">
    <img src="https://respira.press/hero/elemental-hero.jpg" alt="Respira — AI Infrastructure for WordPress" width="100%">
  </a>
</p>

<h1 align="center">Respira WordPress MCP Server</h1>

<p align="center">
  <strong>172 MCP tools. 11 page builders. The AI infrastructure layer for WordPress.</strong><br>
  Element-level editing, full page creation, HTML-to-builder conversion, stock images, bulk operations — all through one MCP server.
</p>

<p align="center">
  <a href="https://www.npmjs.com/package/@respira/wordpress-mcp-server"><img src="https://img.shields.io/npm/v/@respira/wordpress-mcp-server.svg?style=flat-square&color=10b981" alt="npm version"></a>
  <a href="https://www.npmjs.com/package/@respira/wordpress-mcp-server"><img src="https://img.shields.io/npm/dm/@respira/wordpress-mcp-server.svg?style=flat-square" alt="npm downloads"></a>
  <a href="https://glama.ai/mcp/servers/webmyc/respira-wordpress-mcp"><img src="https://glama.ai/mcp/servers/webmyc/respira-wordpress-mcp/badges/score.svg" alt="Glama Score"></a>
  <img src="https://img.shields.io/badge/tools-172-10b981?style=flat-square" alt="172 Tools">
  <img src="https://img.shields.io/badge/builders-11-10b981?style=flat-square" alt="11 Page Builders">
  <img src="https://img.shields.io/badge/TypeScript-100%25-blue?style=flat-square&logo=typescript&logoColor=white" alt="TypeScript">
</p>

<p align="center">
  <a href="https://glama.ai/mcp/servers/webmyc/respira-wordpress-mcp">
    <img src="https://glama.ai/mcp/servers/webmyc/respira-wordpress-mcp/badges/quality.svg" alt="Respira for WordPress MCP server" />
  </a>
</p>

## Quick Start

```bash
npx -y @respira/wordpress-mcp-server --setup
```

Auto-detects your AI tool (Claude Code, Cursor, Windsurf, etc.) and writes the MCP config.

## Manual Setup

```json
{
  "mcpServers": {
    "respira-wordpress": {
      "command": "npx",
      "args": ["-y", "@respira/wordpress-mcp-server"],
      "env": {
        "WORDPRESS_URL": "https://your-site.com",
        "WORDPRESS_API_KEY": "your-respira-api-key"
      }
    }
  }
}
```

## What You Get

| Category | Tools | Highlights |
|----------|-------|------------|
| **Core WordPress** | 131 | Pages, posts, media, menus, users, taxonomies, plugins, options |
| **Bricks Intelligence** | 20 | ACSS, design system, query loops, global classes, typography |
| **WooCommerce** | 21 | Products, orders, stock, categories, sales reports |

### Safety Built In

- **Duplicate-before-edit** — every edit creates a draft copy. Live site untouched until approved.
- **Snapshots** — automatic version history with one-click rollback.
- **Optimistic locking** — content hash validation prevents stale overwrites.

### 11 Page Builders

Elementor, Divi 4+5, Bricks, Gutenberg, WPBakery, Oxygen, Beaver Builder, Brizy, Visual Composer, Thrive Architect, Breakdance.

### 26 AI Skills

Pre-built workflows: SEO audits, accessibility scans, technical debt analysis, builder migrations, image optimization, internal link building, and more at [respira.press/skills](https://respira.press/skills).

## Multi-Site (Agencies)

```json
{
  "mcpServers": {
    "respira-wordpress": {
      "command": "npx",
      "args": ["-y", "@respira/wordpress-mcp-server"],
      "env": {
        "RESPIRA_CONFIG_FILE": "~/.respira/config.json"
      }
    }
  }
}
```

```json
{
  "sites": [
    { "url": "https://site1.com", "apiKey": "key1" },
    { "url": "https://site2.com", "apiKey": "key2" }
  ]
}
```

## Requirements

- Node.js 18+
- WordPress site with [Respira plugin](https://respira.press) installed
- API key from wp-admin → Respira → Setup

## Changelog

### 5.5.0 (April 2026)
- Graceful Sentry profiler initialization
- Angie bridge error handling for Elementor integration
- Fixed MCP registry description and public repo

### 5.4.0 (March 2026)
- 20 Bricks Deep Intelligence tools (ACSS, design system, query loops)
- Cross-site element search
- Optimistic locking with contentHash
- 172 total tools

### 5.2.0 (March 2026)
- 65 new tools — element-level editing, build_page, HTML-to-builder conversion
- Stock images, tool governance, dynamic schemas for 11 builders

### 5.0.0 (March 2026)
- Automatic version history on every edit
- Changes mode that preserves URLs
- Storage management

## Links

- [Website](https://respira.press) · [npm](https://www.npmjs.com/package/@respira/wordpress-mcp-server) · [Docs](https://docs.respira.press) · [Skills](https://respira.press/skills) · [Pricing](https://respira.press/pricing)

## License

MIT © [Respira](https://respira.press)
