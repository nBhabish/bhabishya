# How to Set Up Comments with Notifications

Your blog now has a comment system using **giscus**, which is powered by GitHub Discussions. This means you'll receive notifications when someone comments!

## Setup Steps:

### 1. Create a GitHub Repository for Your Blog
If you haven't already:
- Go to GitHub and create a new public repository
- Push your blog code to this repository

### 2. Enable GitHub Discussions
- Go to your repository on GitHub
- Click **Settings**
- Scroll down to **Features**
- Check the box for **Discussions**

### 3. Configure giscus
- Visit https://giscus.app/
- Enter your repository name (e.g., `username/blog-repo`)
- Choose **Discussion Category**: Select "General" or create a new category
- The page will generate configuration values for you

### 4. Update comments.html
Open `comments.html` and replace these placeholders with your values:
- `YOUR-GITHUB-USERNAME/YOUR-REPO-NAME` - Your GitHub username and repo name
- `YOUR-REPO-ID` - From giscus configuration page
- `YOUR-CATEGORY-ID` - From giscus configuration page

Example:
```html
data-repo="yourusername/yourblog"
data-repo-id="R_kgDOxxxxxx"
data-category="General"
data-category-id="DIC_kwDOxxxxxx"
```

### 5. Automatic Notifications
Once set up, you'll automatically receive:
- **Email notifications** when someone comments (via GitHub)
- **GitHub notifications** in your GitHub notifications panel
- Can customize notification settings in GitHub Settings > Notifications

### 6. Add to Existing Posts
To add comments and share buttons to existing posts, add this to their frontmatter:
```yaml
format:
  html:
    include-after-body:
      - file: ../share-buttons.html
      - file: ../comments.html
```

## Alternative Comment Systems:

If you prefer not to use GitHub:

1. **Utterances** - Similar to giscus but uses GitHub Issues
   - Visit: https://utteranc.es/

2. **Disqus** - Traditional comment system
   - Visit: https://disqus.com/
   - Has ads in free tier

3. **Commento** - Privacy-focused
   - Visit: https://commento.io/
   - Self-hosted or paid hosting

## Features You Get:

✅ Email notifications for new comments
✅ Markdown support in comments
✅ Reactions (👍, ❤️, etc.)
✅ Dark mode support (syncs with your site theme)
✅ No tracking or ads
✅ Free to use
✅ Moderation tools via GitHub
