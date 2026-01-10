# Bhabishya Neupane's Blog

A modern, minimalist blog built with Quarto, featuring dark mode, social sharing, and comment integration.

---

## 🚀 Quick Start

### Creating a New Post

```bash
./new_post.sh "Your Post Title"
```

This will create a new post file in `posts/` with the current date and all the necessary frontmatter.

### Preview Your Site

```bash
quarto preview
```

Opens a live preview at `http://localhost:XXXX` that auto-refreshes when you make changes.

### Build Your Site

```bash
quarto render
```

Generates the static site in the `_site/` directory.

---

## 📝 Managing Posts

### Unpublish a Post (Hide but Keep)

```bash
./unpublish.sh post-filename.qmd
```

Moves the post to `posts/_unpublished/`. It won't appear on your blog but is preserved.

### Publish/Restore a Post

```bash
./publish.sh post-filename.qmd
```

Moves an unpublished post back to the main `posts/` directory.

### Delete a Post (With Backup)

```bash
./delete_post.sh post-filename.qmd
```

Creates a timestamped backup in `posts/_archive/` before removing the post.

### Interactive Manager (All Options)

```bash
./manage_posts.sh
```

Provides a menu with all post management options.

---

## ✅ Pre-Deployment Checklist

### 1. Update Configuration (`_quarto.yml`)

- [ ] Replace `site-url` with your actual domain
- [ ] Add your Google Analytics ID (if using)
- [ ] Verify all navbar links work

### 2. Update About Page (`about.qmd`)

- [ ] Replace placeholder email with your actual email
- [ ] Update LinkedIn URL
- [ ] Update GitHub URL
- [ ] Review and update work experience/education

### 3. Set Up Comments (Optional)

If you want comments on blog posts:

1. Create a public GitHub repository for your blog
2. Enable GitHub Discussions in repo settings
3. Visit https://giscus.app/ and get your configuration
4. Update `comments.html` with your repo details

**See `SETUP-COMMENTS.md` for detailed instructions**

### 4. Review Content

- [ ] Check all blog posts for typos
- [ ] Verify all images and links work
- [ ] Test dark mode on all pages
- [ ] Preview site on mobile devices

### 5. Build Final Version

```bash
quarto render
```

This creates the production-ready site in `_site/`.

---

## 🎨 Customization

### Change Colors

Edit `styles.css` to modify the color scheme:

```css
:root {
  --link-color: rgb(72, 87, 133);  /* Main blue */
  --link-hover: #e63946;           /* Red accent */
}
```

### Modify Landing Page

Edit `index.qmd` to change:
- Hero title
- Subtitle text
- Skill sections
- Button text/links

### Adjust Fonts

All fonts are defined in `styles.css`. Current font is **Patua One** (Patagonia-style).

---

## 📁 Project Structure

```
trial/
├── _quarto.yml           # Main configuration
├── index.qmd             # Landing page
├── about.qmd             # About page
├── styles.css            # Global styles
├── favicon.svg           # Browser icon
├── dark-mode.js          # Theme switcher logic
├── posts/
│   ├── index.qmd         # Blog listing page
│   ├── _template.qmd     # Template for new posts
│   ├── *.qmd             # Your blog posts
│   ├── _unpublished/     # Hidden posts
│   └── _archive/         # Deleted posts (backups)
├── share-buttons.html    # Social sharing buttons
├── comments.html         # Comment system (giscus)
├── robots.txt            # SEO - search engine instructions
├── new_post.sh           # Create new post
├── unpublish.sh          # Hide post
├── publish.sh            # Restore post
├── delete_post.sh        # Delete post (with backup)
└── manage_posts.sh       # Interactive post manager
```

---

## 🌐 Deployment Options

### Option 1: GitHub Pages

1. Push your code to GitHub
2. Go to repository Settings > Pages
3. Select source: GitHub Actions
4. Quarto will auto-deploy on push

### Option 2: Netlify

1. Connect your GitHub repo to Netlify
2. Build command: `quarto render`
3. Publish directory: `_site`

### Option 3: Vercel

1. Import your GitHub repo
2. Framework: Other
3. Build command: `quarto render`
4. Output directory: `_site`

---

## 🔧 Common Tasks

### Adding a New Navbar Link

Edit `_quarto.yml`:

```yaml
navbar:
  left:
    - text: "Projects"
      href: projects.qmd
```

### Changing Site Description

Edit `_quarto.yml`:

```yaml
website:
  description: "Your new description here"
```

### Updating Footer

Edit `_quarto.yml`:

```yaml
page-footer:
  center: "© 2025 Your Name · Custom Text"
```

### Adding Social Links to Footer

Edit the footer in `_quarto.yml` or create custom footer HTML.

---

## 🎯 Features

✅ **Dark Mode** - Automatic theme switching with toggle
✅ **Social Sharing** - Twitter, LinkedIn, Email, Copy link
✅ **Comments** - GitHub Discussions integration (optional)
✅ **SEO Optimized** - Sitemap, meta tags, Open Graph
✅ **RSS Feed** - Auto-generated at `/posts/index.xml`
✅ **Responsive** - Mobile-friendly design
✅ **Animations** - Smooth fade-in effects
✅ **Syntax Highlighting** - For code blocks

---

## 📚 Post Frontmatter Template

When creating posts manually, use this format:

```yaml
---
title: "Your Post Title"
date: 2025-01-03
author: Bhabishya Neupane
description: "Brief description for SEO"
format:
  html:
    page-layout: full
    include-after-body:
      - file: ../share-buttons.html
      - file: ../comments.html
---
```

---

## 🐛 Troubleshooting

**Dark mode not working?**
- Clear browser cache
- Check that `dark-mode.js` is loaded
- Verify CSS variables are defined in `styles.css`

**Posts not showing?**
- Check the post is in `posts/` (not `_unpublished/`)
- Verify frontmatter is valid YAML
- Run `quarto render` to rebuild

**Comments not appearing?**
- Ensure GitHub Discussions is enabled
- Verify giscus configuration in `comments.html`
- Check repo is public

**Links not working after deployment?**
- Update `site-url` in `_quarto.yml`
- Check relative vs absolute paths
- Verify all `href` attributes

---

## 📞 Support

- **Quarto Docs**: https://quarto.org/docs/
- **GitHub Issues**: Report problems with giscus
- **Stack Overflow**: Tag questions with `quarto`

---

## 📝 License

Your content, your rules! Add a license file if desired.

---

**Built with ❤️ using Quarto**
