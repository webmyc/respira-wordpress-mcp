<p align="center">
  <a href="https://respira.press">
    <img src="https://respira.press/hero/storefront-hero.jpg" alt="Respira v6.0 Storefront — AI Infrastructure for WordPress" width="100%">
  </a>
</p>

<h1 align="center">Respira WordPress MCP Server</h1>

<p align="center">
  <strong>180+ MCP tools. 12 page builders. Context-aware tool filtering. The AI infrastructure layer for WordPress.</strong><br>
  Element-level editing, full page creation, HTML-to-builder conversion with rendering fidelity validation, per-site tool governance, storefront design intelligence, stock images, bulk operations — all through one MCP server.
</p>

<p align="center">
  <a href="https://www.npmjs.com/package/@respira/wordpress-mcp-server"><img src="https://img.shields.io/npm/v/@respira/wordpress-mcp-server.svg?style=flat-square&color=10b981" alt="npm version"></a>
  <a href="https://www.npmjs.com/package/@respira/wordpress-mcp-server"><img src="https://img.shields.io/npm/dm/@respira/wordpress-mcp-server.svg?style=flat-square" alt="npm downloads"></a>
  <img src="https://img.shields.io/badge/tools-172+-10b981?style=flat-square" alt="172+ Tools">
  <img src="https://img.shields.io/badge/builders-12-10b981?style=flat-square" alt="12 Page Builders">
  <img src="https://img.shields.io/badge/TypeScript-100%25-blue?style=flat-square&logo=typescript&logoColor=white" alt="TypeScript">
</p>

<p align="center">
  <a href="https://respira.press">Website</a> •
  <a href="https://respira.press/docs">Docs</a> •
  <a href="https://respira.press/plugin">Plugin</a> •
  <a href="https://respira.press/support">Support</a> •
  <a href="https://respira.press/addons/woocommerce">WooCommerce Add-on</a>
</p>

---

## What this repo is, what it isn't

This repository is the **public listing** for the Respira WordPress MCP server. The actual server source ships on npm as [`@respira/wordpress-mcp-server`](https://www.npmjs.com/package/@respira/wordpress-mcp-server) — that wrapper code is **MIT-licensed** and you're welcome to read, fork, or vendor it.

The server is a **client for the Respira WordPress plugin**, not a standalone product. To do real work it needs:
- The [Respira for WordPress](https://respira.press/plugin) plugin installed on your site
- A valid Respira API key bound to a license

**The plugin (1000+ PHP files implementing builder intelligence, snapshots, governance, etc.) is not open source.** It's distributed under a commercial license. Free trial available at [respira.press](https://respira.press); paid plans start at €9/mo.

In short: the wrapper you `npx -y` is open. The product behind it isn't. If you want a self-contained "AI-edits-WordPress" stack with no commercial dependency, this isn't it — and that's by design. The plugin is built and maintained full-time, and the license fees are how that happens.

For security reports see [SECURITY.md](./SECURITY.md).

---

## What Makes Respira Different

Other WordPress MCP servers wrap the REST API. They can create posts and pages, but **they can't touch your page builder content**.

Respira includes a WordPress plugin that gives AI **native access** to 12 page builders — plus element-level precision, full page creation from structure, HTML-to-builder conversion, storefront design intelligence, stock image search, and bulk operations across hundreds of pages.

### New in v6.0: Context-Aware Tool Filtering

The MCP server automatically filters the tool list based on your site's detected builder and active plugins. A Divi site without WooCommerce sees ~130 tools instead of ~170. Less noise, faster AI responses, lower token usage. Fail-open: if detection fails, the full list is returned.

| Capability | Respira | Other MCP Servers |
|---|---|---|
| Page builder support | **12 builders** (incl. Flatsome) | None |
| Element-level find/update/move/remove | **Yes** | No |
| Build full pages from structure | **Yes** | No |
| Convert HTML to native builder | **Yes** | No |
| Stock image search + sideload | **Yes** | No |
| Bulk operations (100 pages/call) | **Yes** | No |
| 27 widget shortcuts (add_heading, etc.) | **Yes** | No |
| Duplicate-before-edit safety | **Yes** | No |
| Snapshot rollback | **Yes** | No |
| SEO / Core Web Vitals / AEO analysis | **Yes** | No |
| WooCommerce (products, orders, inventory) | **Yes** (add-on) | No |
| Tool governance (per-tool enable/disable) | **Yes** | No |

---

## Quick Start (3 Minutes)

### Step 1: Install the WordPress Plugin

Download from [respira.press/plugin](https://respira.press/plugin) → upload to WordPress → activate → go to **Respira > API Keys** → generate a key.

### Step 2: Configure Your AI Tool

<details>
<summary><b>Claude Code</b></summary>

```bash
claude mcp add respira-wordpress -- npx -y @respira/wordpress-mcp-server
```

</details>

<details>
<summary><b>Cursor</b></summary>

Create `.cursor/mcp.json` in your project:
```json
{
  "mcpServers": {
    "respira-wordpress": {
      "command": "npx",
      "args": ["-y", "@respira/wordpress-mcp-server"]
    }
  }
}
```

</details>

<details>
<summary><b>Windsurf</b></summary>

Add to your Windsurf MCP configuration:
```json
{
  "mcpServers": {
    "respira-wordpress": {
      "command": "npx",
      "args": ["-y", "@respira/wordpress-mcp-server"]
    }
  }
}
```

</details>

<details>
<summary><b>Claude Desktop</b></summary>

Add to `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS) or `%APPDATA%\Claude\claude_desktop_config.json` (Windows):
```json
{
  "mcpServers": {
    "respira-wordpress": {
      "command": "npx",
      "args": ["-y", "@respira/wordpress-mcp-server"]
    }
  }
}
```

</details>

### Step 3: Add Your Site

Create `~/.respira/config.json`:
```json
{
  "sites": [
    {
      "id": "my-site",
      "name": "My WordPress Site",
      "url": "https://yoursite.com",
      "apiKey": "respira_your-api-key",
      "default": true
    }
  ]
}
```

Or run the interactive setup wizard: `npx @respira/wordpress-mcp-server --setup`

### Tool Limit? Use `enabledTools`

Some MCP clients (Antigravity, etc.) have a hard limit on active tools (often 100). Respira exposes 172 tools by default. To stay under the limit, add `enabledTools` to your config — only those tools will appear in the listing:

```json
{
  "sites": [{ "..." : "..." }],
  "preferences": {
    "enabledTools": [
      "respira_read_page",
      "respira_update_page",
      "respira_list_pages",
      "respira_find_element",
      "respira_update_element",
      "respira_build_page",
      "respira_get_site_context",
      "respira_get_builder_info"
    ]
  }
}
```

Site management tools (`respira_list_sites`, `respira_switch_site`, `respira_get_active_site`) are always included. Unlisted tools still work if called — the filter only controls what's advertised to the client.

**Done.** Restart your AI tool and start editing.

---

## v6.3 — MCP Protocol Compliance

### `structuredContent` in All Tool Results
Every successful tool response now includes `structuredContent` — the raw JSON object — alongside the existing `content[0].text` (stringified JSON). This follows the MCP 2025-06-18 spec. Clients that understand `structuredContent` get direct programmatic access to tool results without parsing JSON from text. Older clients are unaffected — the `content` array is still there.

### Improved Error Taxonomy
Unknown tool names now return a proper `CallToolResult` with `isError: true` and a hint to discover available tools, instead of throwing a protocol-level JSON-RPC error. This lets LLMs self-correct gracefully rather than hitting a hard protocol failure.

---

## v6.0 "Storefront" — What's New

### Context-Aware Tool Filtering
The MCP server automatically filters the tool list based on your site's detected builder and active plugins. A Divi site without WooCommerce sees ~130 tools instead of ~170. Less noise, faster AI responses, lower token usage. Fail-open: if detection fails, the full list is returned.

### Flatsome UX Builder (Builder #12)
Full round-trip shortcode editing, element-level precision, declarative page creation, and 55-element intelligence. Detected by active theme — mixed-builder sites handled per-page.

### 15 New WooCommerce Commerce Tools
Storefront design intelligence bridges commerce data and page builder visuals. Bulk pricing, catalog health audits, advanced filtering, natural language product search. Total WooCommerce tools: 36.

### Element-Level Operations
Find, update, move, duplicate, and remove individual elements inside any page builder — by ID, type, CSS class, or content text.

```
respira_find_element({ post_id: 42, identifier_type: "type", identifier_value: "heading" })
respira_update_element({ post_id: 42, identifier_type: "content", identifier_value: "Old Title", updates: { heading: "New Title" } })
```

### Build Full Pages
Create complete pages from a declarative widget structure in one call.

```
respira_build_page({ title: "Services", structure: [
  { type: "heading", settings: { heading: "Our Services", tag: "h1" } },
  { type: "text", settings: { text: "<p>We build amazing things.</p>" } },
  { type: "button", settings: { text: "Get Started", link: "/contact" } }
]})
```

### HTML-to-Builder Conversion
Convert any HTML into native builder widgets — with CSS extraction, responsive mapping, and a fidelity report.

```
respira_convert_html_to_builder({ html: "<section>...</section>", options: { title: "Homepage", preserve_tokens: true } })
→ { page_id: 123, fidelity: { score: 92, sections_matched: 14 } }
```

### Stock Images
Search Openverse (Creative Commons) and sideload directly into the Media Library with auto-attribution.

```
respira_search_stock_images({ query: "mountain landscape", per_page: 10 })
respira_sideload_image({ url: "https://...", caption: "Photo by...", alt: "Mountain" })
```

### Bulk Operations
Apply changes across up to 100 pages in a single call — with mandatory snapshots for rollback.

```
respira_bulk_pages_operation({ page_ids: [12, 15, 18, 22], operation: { type: "find_and_replace", find: "2025", replace: "2026" } })
```

### 27 Widget Shortcuts
One-liner tools to add any widget to a page without building the full structure:

```
respira_add_heading({ post_id: 42, title: "Hello World", tag: "h2" })
respira_add_button({ post_id: 42, text: "Buy Now", url: "/shop" })
respira_add_image({ post_id: 42, image_url: "https://..." })
```

---

## 12 Supported Page Builders

<p align="center">
  <img src="https://img.shields.io/badge/Elementor-Full_Intelligence-92003B?style=for-the-badge" alt="Elementor">
  <img src="https://img.shields.io/badge/Divi_5-Full_Intelligence-7c3aed?style=for-the-badge" alt="Divi 5">
  <img src="https://img.shields.io/badge/Bricks-Full_Intelligence-ef6723?style=for-the-badge" alt="Bricks">
  <img src="https://img.shields.io/badge/Flatsome-Full_Intelligence-3d9a8b?style=for-the-badge" alt="Flatsome">
</p>

| Builder | Support Level | Element Ops | Build Page | Dynamic Schemas |
|---|---|---|---|---|
| **Elementor** | Full Intelligence | Native API | Yes | Yes — runtime control registry |
| **Divi 5** | Full Intelligence | Native API | Yes | Yes — 40+ module definitions |
| **Divi 4** | Full Intelligence | Tree utility | Yes | Static schemas |
| **Flatsome** | Full Intelligence | Tree utility | Yes | Yes — 55-element intelligence |
| **Beaver Builder** | Full Support | Tree utility | Yes | Static schemas |
| **Bricks** | Full Intelligence | Native API | Yes | Yes — 20 dedicated tools, ACSS integration |
| **Gutenberg** | Full Support | Tree utility | Yes | Block registry |
| **Oxygen** | Smart Defaults | Tree utility | Yes | Static schemas |
| **WPBakery** | Smart Defaults | Tree utility | Yes | Static schemas |
| **Breakdance** | Smart Defaults | Tree utility | Yes | Static schemas |
| **Brizy** | Basic | Tree utility | Best-effort | — |
| **Thrive Architect** | Basic | Tree utility | Best-effort | — |
| **Visual Composer** | Basic | Tree utility | Best-effort | — |

---

## All Tools

### Bricks Deep Intelligence (20 tools) — NEW in v5.4
| Tool | Description |
|---|---|
| `respira_list_bricks_global_classes` | List all global CSS classes with settings |
| `respira_create_bricks_global_class` | Create a new global CSS class |
| `respira_update_bricks_global_class` | Update an existing global class (merge) |
| `respira_delete_bricks_global_class` | Delete a global class by ID |
| `respira_get_bricks_theme_styles` | Get site-wide theme style configuration |
| `respira_update_bricks_theme_styles` | Update theme styles (full replace) |
| `respira_get_bricks_color_palette` | Get color palette groups |
| `respira_update_bricks_color_palette` | Update color palette (full replace) |
| `respira_get_bricks_typography` | Get global CSS variables and typography scales |
| `respira_update_bricks_typography` | Update global variables and categories |
| `respira_list_bricks_components` | List all Bricks templates/components |
| `respira_get_bricks_component` | Get a component with full element structure |
| `respira_apply_bricks_component` | Insert a component into a page with ID remapping |
| `respira_search_bricks_elements` | **NEW** Search across all pages by element type, class, or setting |
| `respira_bricks_health_check` | **NEW** Diagnostic: orphaned elements, duplicate IDs, broken refs |
| `respira_bricks_detect_acss` | **NEW** Detect Automatic.css installation and design tokens |
| `respira_bricks_import_acss` | **NEW** Import ACSS utility classes into Bricks global registry |
| `respira_bricks_query_loops` | **NEW** Find all query loop elements, filter by post type |
| `respira_bricks_style_profile` | **NEW** Analyze page design patterns (colors, spacing, typography) |
| `respira_bricks_design_system` | **NEW** Single-call export of complete Bricks design system |

### Element Operations (7 tools) — NEW in v5.2
| Tool | Description |
|---|---|
| `respira_find_element` | Find element by ID, type, CSS class, or content text |
| `respira_update_element` | Update settings on a specific element |
| `respira_move_element` | Move element to a different container/position |
| `respira_duplicate_element` | Clone an element with new IDs |
| `respira_remove_element` | Remove an element from the page |
| `respira_batch_update` | Apply multiple operations atomically (extract once → apply all → inject once) |
| `respira_reorder_elements` | Reorder children within a container |

### Page Building (3 tools) — NEW in v5.2
| Tool | Description |
|---|---|
| `respira_build_page` | Create a complete page from declarative widget structure |
| `respira_convert_html_to_builder` | Convert HTML into native builder widgets with fidelity report |
| `respira_bulk_pages_operation` | Apply operations across up to 100 pages with mandatory snapshots |

### Stock Images (2 tools) — NEW in v5.2
| Tool | Description |
|---|---|
| `respira_search_stock_images` | Search Openverse for Creative Commons images |
| `respira_sideload_image` | Download and import image into Media Library with attribution |

### 27 Widget Shortcuts — NEW in v5.2
Add any widget to a page in one call:

`respira_add_heading` · `respira_add_text` · `respira_add_button` · `respira_add_image` · `respira_add_video` · `respira_add_section` · `respira_add_divider` · `respira_add_spacer` · `respira_add_icon` · `respira_add_icon_list` · `respira_add_social_icons` · `respira_add_form` · `respira_add_map` · `respira_add_counter` · `respira_add_progress_bar` · `respira_add_testimonial` · `respira_add_tabs` · `respira_add_accordion` · `respira_add_toggle` · `respira_add_alert` · `respira_add_html` · `respira_add_menu` · `respira_add_sidebar` · `respira_add_search` · `respira_add_gallery` · `respira_add_slider` · `respira_add_pricing_table`

### Page Builder Tools (6 tools)
| Tool | Description |
|---|---|
| `respira_get_builder_info` | Active builder, version, modules, support level |
| `respira_extract_builder_content` | Extract structured content from any page |
| `respira_inject_builder_content` | Replace page content with builder data |
| `respira_update_module` | Update one module by path or label (v1 — use `update_element` for v2) |
| `respira_find_builder_targets` | Find editable targets in a page |
| `respira_apply_builder_patch` | Apply a JSON patch to builder content |

### Pages & Posts (14 tools)
| Tool | Description |
|---|---|
| `respira_list_pages` / `respira_read_page` | List and read pages with builder detection |
| `respira_update_page` / `respira_delete_page` | Update (with safe duplicate) and delete |
| `respira_create_page_duplicate` | Create working copy before editing |
| `respira_list_posts` / `respira_read_post` | List and read posts |
| `respira_update_post` / `respira_delete_post` | Update and delete posts |
| `respira_create_post_duplicate` | Duplicate a post |
| `respira_list_custom_posts` / `respira_get_custom_post` | Custom post types |
| `respira_create_custom_post` / `respira_update_custom_post` / `respira_delete_custom_post` | CRUD for CPTs |

### Snapshots & Rollback (4 tools)
| Tool | Description |
|---|---|
| `respira_list_snapshots` | List all snapshots for a post |
| `respira_get_snapshot` | Get snapshot content |
| `respira_diff_snapshots` | Compare two snapshots |
| `respira_restore_snapshot` | Restore a previous version |

### Analysis (8 tools)
| Tool | Description |
|---|---|
| `respira_analyze_seo` | Full SEO audit with actionable recommendations |
| `respira_analyze_performance` | Page speed and optimization |
| `respira_get_core_web_vitals` | LCP, FID, CLS scores |
| `respira_analyze_aeo` | AI search engine optimization |
| `respira_analyze_readability` | Flesch score, sentence analysis |
| `respira_analyze_images` | Image optimization audit |
| `respira_check_seo_issues` | Technical SEO checklist |
| `respira_check_structured_data` | Schema.org validation |
| `respira_analyze_rankmath` | RankMath score + ready-to-apply fixes |
| `respira_scan_page_accessibility` | WCAG accessibility scan |
| `respira_list_accessibility_scans` | Previous scan history |
| `respira_get_accessibility_scan` | Detailed scan results + violations |
| `respira_apply_accessibility_fixes` | Auto-fix a11y violations |

### Menus (8 tools)
| Tool | Description |
|---|---|
| `respira_list_menus` / `respira_get_menu` / `respira_create_menu` / `respira_update_menu` / `respira_delete_menu` | Full menu CRUD |
| `respira_list_menu_items` / `respira_get_menu_item` / `respira_create_menu_item` / `respira_update_menu_item` / `respira_delete_menu_item` | Menu item management |
| `respira_list_menu_locations` / `respira_assign_menu_location` | Theme location assignment |

### Media (5 tools)
| Tool | Description |
|---|---|
| `respira_list_media` / `respira_get_media` | Browse media library |
| `respira_upload_media` / `respira_update_media` / `respira_delete_media` | Upload, update metadata, delete |
| `respira_update_media_batch` | Bulk update alt text, title, caption (up to 50 items) |

### Users & Comments (7 tools)
| Tool | Description |
|---|---|
| `respira_list_users` / `respira_get_user` / `respira_create_user` / `respira_update_user` / `respira_delete_user` | User management |
| `respira_list_comments` / `respira_get_comment` / `respira_create_comment` / `respira_update_comment` / `respira_delete_comment` | Comment operations |

### Taxonomies (5 tools)
| Tool | Description |
|---|---|
| `respira_list_taxonomies` / `respira_get_taxonomy` | Browse taxonomies |
| `respira_list_terms` / `respira_get_term` / `respira_create_term` / `respira_update_term` / `respira_delete_term` | Term CRUD |
| `respira_list_post_types` / `respira_get_post_type` | Post type info |

### Site & Plugins (10 tools)
| Tool | Description |
|---|---|
| `respira_get_site_context` | WordPress version, theme, plugins, URL |
| `respira_get_theme_docs` | Theme documentation and structure |
| `respira_list_plugins` / `respira_install_plugin` / `respira_activate_plugin` / `respira_deactivate_plugin` / `respira_update_plugin` / `respira_delete_plugin` | Plugin management |
| `respira_list_options` / `respira_get_option` / `respira_update_option` / `respira_delete_option` | WordPress options |
| `respira_validate_security` | Security audit |
| `respira_get_server_compatibility` | Plugin/MCP version check |

### Multi-Site (3 tools)
| Tool | Description |
|---|---|
| `respira_list_sites` | List all configured WordPress sites |
| `respira_switch_site` | Switch active site |
| `respira_get_active_site` | Get current site info |

### WooCommerce Add-on (36 tools)
Available when the [WooCommerce add-on](https://respira.press/addons/woocommerce) is installed. Included free with Studio and Founder plans.

| Category | Tools |
|---|---|
| **Storefront intelligence** (NEW in v6.0) | `analyze_shop_page`, `analyze_product_page`, `update_product_card_layout`, `add_low_stock_badge`, `add_sale_badge`, `update_checkout_layout` |
| **Catalog operations** (NEW in v6.0) | `list_products_advanced`, `bulk_update_products`, `analyze_catalog_health`, `find_product_by_natural_language` |
| **Pricing** (NEW in v6.0) | `bulk_update_prices`, `schedule_sale`, `revert_pricing` |
| **Inventory** (NEW in v6.0) | `bulk_update_stock`, `find_low_stock` |
| **Product CRUD** | `list_products`, `get_product`, `create_product`, `update_product`, `duplicate_product` |
| **Order management** | `list_orders`, `get_order`, `update_order_status` |
| **Inventory control** | `get_stock_status`, `update_stock` |
| **Product categories** | `list_categories`, `get_category`, `create_category`, `update_category`, `delete_category` |
| **Product tags** | `list_tags`, `get_tag`, `create_tag`, `update_tag`, `delete_tag` |
| **Analytics** | `sales_report` |

---

## Safe Editing

Every mutation creates a snapshot. Roll back anytime.

1. **Snapshot captured** before every edit
2. **Duplicate-before-edit** — original stays untouched
3. **Approval workflow** — review changes in WordPress admin
4. **Rollback** — restore any snapshot with `respira_restore_snapshot`

### Tool Governance

Admins can enable/disable individual tools from the WordPress dashboard. Governance applies to both REST API and WebMCP/Abilities API paths.

---

## Multi-Site Support

Manage multiple WordPress sites from one config:
```json
{
  "sites": [
    { "id": "production", "name": "Production", "url": "https://mysite.com", "apiKey": "respira_prod_key", "default": true },
    { "id": "staging", "name": "Staging", "url": "https://staging.mysite.com", "apiKey": "respira_staging_key" }
  ]
}
```

Switch sites: `respira_switch_site({ siteId: "staging" })`

For agencies managing many sites, use the hosted setup at [respira.press/dashboard/mcp](https://www.respira.press/dashboard/mcp) to generate configs and install commands from your account.

---

## Tool Naming: `respira_*`

All tools use `respira_*` names (e.g. `respira_update_page`, `respira_find_element`). The legacy `wordpress_*` aliases are deprecated and will be removed in a future release. Update any prompts or workflows that still reference `wordpress_*` tools.

---

## WordPress AI Ecosystem

Respira works with the official WordPress AI stack:

| Path | How it works | Requirements |
|---|---|---|
| **Standalone MCP** (this package) | `npx @respira/wordpress-mcp-server` | Node 18+, Respira plugin |
| **WordPress MCP Adapter** | Abilities auto-discovered via WP-CLI STDIO | WP 6.9+, MCP Adapter, Respira v5.0+ |
| **WebMCP** | Browser-native MCP via Chrome Abilities API | Chrome 146+, Respira plugin |

---

## Quick Install

Three paths — pick the one that matches how you work.

### One-command install (recommended)

```bash
npx add-mcp "npx -y @respira/wordpress-mcp-server"
```

Auto-detects your AI tool (Claude Code, Cursor, Windsurf, Codex, and 9+ more) and writes the correct config file. Powered by [add-mcp](https://github.com/neondatabase/add-mcp).

After running, set your environment variables:
```bash
# In your shell profile or .env
export WORDPRESS_URL="https://yoursite.com"
export WORDPRESS_API_KEY="respira_your_key"
```

### Interactive setup wizard

```bash
npx @respira/wordpress-mcp-server --setup
```

Walks you through site URL, API key, HTTP auth (for staging sites), and connection testing. Saves config to `~/.respira/config.json`.

### Manual configuration

See the [Quick Start](#quick-start-3-minutes) section above for per-tool JSON config examples (Cursor, Claude Code, Claude Desktop, Windsurf).

---

## Installation Options

### NPX (Easiest)
```bash
npx -y @respira/wordpress-mcp-server
```
Zero-install. Good for trying it out. **Downside:** the npx cache can get corrupted (interrupted installs, external drives, antivirus quarantine) and produce confusing `ENOENT` errors. If you hit any, see Troubleshooting below.

### Global Install (Most Stable — Recommended for Daily Use)
```bash
npm install -g @respira/wordpress-mcp-server
respira-wordpress-mcp
```
Avoids the npx cache entirely. Best choice if you're using Respira every day or hit any npx-related errors.

### Interactive Setup Wizard
```bash
npx @respira/wordpress-mcp-server --setup
```

### CLI Options

| Flag | Alias | Description |
|---|---|---|
| `--setup` | | Interactive setup wizard |
| `--list` | | List configured sites |
| `--test` | | Test connection |
| `--stdio` | | STDIO transport (MCP Adapter) |
| `--doctor` | `-d` | Run health diagnostics |
| `--doctor --json` | | Health diagnostics as JSON |
| `--help` | | Help |

### Environment Variables
```bash
export WP_SITE_URL=https://your-site.com
export WP_API_KEY=respira_your-api-key
```

---

## Health Check

Verify your setup is working end-to-end:

```bash
npx @respira/wordpress-mcp-server --doctor
```

Checks Node.js version, config file, site connectivity, plugin version, API compatibility, and available updates. Reports pass/fail for each check with actionable messages.

```bash
npx @respira/wordpress-mcp-server --doctor --json
```

Machine-readable output for CI/CD pipelines or AI tool diagnostics.

---

## Troubleshooting

<details>
<summary><b>Windows: 'npx' not recognized</b></summary>

Use the full path:
```json
{ "command": "C:\\Program Files\\nodejs\\npx.cmd", "args": ["-y", "@respira/wordpress-mcp-server"] }
```

Or install globally: `npm install -g @respira/wordpress-mcp-server` then use `{ "command": "respira-wordpress-mcp" }`.

</details>

<details>
<summary><b>Connection failed</b></summary>

1. Check API key: WordPress > Respira > API Keys
2. URL must include `https://`
3. Plugin must be activated
4. Check if hosting blocks REST API

</details>

<details>
<summary><b>"HTML instead of JSON" / homepage redirect on every tool call</b></summary>

Some WordPress sites have plugin or theme rewrite rules that catch `/wp-json/[anything]` and rewrite the path to `index.php` *without* the `?rest_route=` query var. The result: WordPress's `redirect_canonical()` 301-redirects the request to the homepage (you'll see `x-redirect-by: WordPress` on the redirect chain), and the MCP server gets HTML back where it expected JSON.

Since v6.11.2, the MCP server **auto-detects this and transparently retries the call as `?rest_route=...` against the site root**. If the retry returns JSON, it sets a per-session sticky flag and routes every subsequent call directly through `?rest_route=`, with one stderr warning on first activation.

For sites where you know this rewrite shadowing is in play, you can skip the pretty-permalink probe entirely by adding `forceRestRoute: true` to the site config:

```json
{
  "sites": [
    {
      "id": "my-site",
      "name": "My WordPress Site",
      "url": "https://yoursite.com",
      "apiKey": "respira_your-api-key",
      "default": true,
      "forceRestRoute": true
    }
  ]
}
```

Run `wordpress_diagnose_connection` for triangulation — it now probes both the pretty path and the `?rest_route=` form, and reports `rest_route_fallback_worked`, `rest_route_fallback_active`, and `force_rest_route_configured`.

</details>

<details>
<summary><b>Tools not showing</b></summary>

1. Restart your AI tool completely
2. Validate JSON syntax in config file
3. Check config file location
4. Run `npx @respira/wordpress-mcp-server --test` to verify

</details>

<details>
<summary><b>ENOENT errors mentioning <code>/_npx/</code> or <code>node_modules</code></b></summary>

Your npx cache is corrupted. Common causes: interrupted install, external drive disconnected mid-install, antivirus quarantining files, or `npm cache clean` running while npx was active.

Fix with one of these (in order of preference):

```bash
# 1. Switch to global install — most stable, recommended
npm install -g @respira/wordpress-mcp-server
# then in your AI client config, use:
#   "command": "respira-wordpress-mcp"   (no "npx" wrapper)

# 2. Or clear the npx cache and let it rebuild
npx clear-npx-cache
npx -y @respira/wordpress-mcp-server

# 3. Or nuke the entire npm cache
npm cache clean --force
```

</details>

---

## Security

API key validation happens server-side in the WordPress plugin. The MCP server passes credentials but does not store or validate them.

Report vulnerabilities to security@respira.press.

---

## Links

- [Website](https://respira.press)
- [Documentation](https://respira.press/docs)
- [Download Plugin](https://respira.press/plugin)
- [WooCommerce Add-on](https://respira.press/addons/woocommerce)
- [Support](https://respira.press/support)

---

## Where to Find Respira

| Directory | Listing |
|---|---|
| **npm** | [`@respira/wordpress-mcp-server`](https://www.npmjs.com/package/@respira/wordpress-mcp-server) |
| **Official MCP Registry** | `io.github.webmyc/respira-wordpress` |
| **Smithery** | [smithery.ai](https://smithery.ai) |
| **Glama** | [glama.ai/mcp/servers](https://glama.ai/mcp/servers) |
| **mcp.so** | [mcp.so](https://mcp.so) |
| **cursor.directory** | [cursor.directory](https://cursor.directory) |

---

## License

MIT © [Respira](https://respira.press)

---

<p align="center">
  <strong>172 tools. 12 builders. The AI infrastructure layer for WordPress.</strong><br>
  <a href="https://respira.press">respira.press</a>
</p>
