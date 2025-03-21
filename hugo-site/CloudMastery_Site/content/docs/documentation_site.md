---
title: "Code & Cloud Diary"
linkTitle: "Code & Cloud Diary- a Hugo Doc Site"
weight: 2
menu:
  main:
    parent: "Documents"
    weight: 2
---

# Hugo Documentation Site - Setup & Local Testing

## Introduction
This document outlines the step-by-step process for creating and testing a Hugo-based documentation site locally. The purpose of building this documentation site is to create a structured, easily maintainable, and scalable platform for technical documentation. 

### Why Use Hugo?
- **Fast and Lightweight**: Hugo is a static site generator that compiles content quickly.
- **Markdown-Based**: Allows easy content writing and management.
- **No Database Required**: Everything is stored as files, making it simple and efficient.
- **Highly Customizable**: Offers extensive theming and configuration options.

### Why Use the Docsy Theme?
- **Optimized for Documentation**: Docsy provides a well-structured layout for technical documentation.
- **Built-in Navigation**: Comes with sidebar navigation and search functionality.
- **Responsive & Modern UI**: Designed for readability and easy navigation.
- **Supports Multi-Language & Versioning**: Useful for long-term documentation management.

---

## Setting Up the Hugo Site
### Install Hugo Locally
To start building the site, install Hugo on your local machine.

#### For macOS (Homebrew)
```sh
brew install hugo
```

#### For Linux
```sh
sudo apt install hugo
```

#### For Windows (Chocolatey)
```sh
choco install hugo -confirm
```

### Verify Installation
```sh
hugo version
```
Ensure the output confirms that Hugo is installed.

### Initialize a New Hugo Site
```sh
hugo new site my-doc-site
cd my-doc-site
```

---

## Configuring the Hugo Site
### Choose and Install a Theme
For a documentation-style site, the Docsy theme is recommended.

#### Clone the Docsy Theme
```sh
git submodule add https://github.com/google/docsy.git themes/docsy
git submodule update --init --recursive
```

### Update `config.toml`
Edit `config.toml` to apply the theme.
```toml
theme = "docsy"
baseURL = "http://localhost:1313/"
languageCode = "en-us"
title = "Cloud Mastery Documentation"
```

### Create Sample Content
```sh
hugo new content/docs/getting-started.md
hugo new content/blog/first-post.md
```
Edit these files with relevant documentation.

---

## Managing Content (Docs & Images)
### Organizing Documentation
Create structured content within the `content/docs/` directory.
```sh
mkdir -p content/docs
hugo new content/docs/overview.md
hugo new content/docs/setup.md
hugo new content/docs/deployment.md
```
Update each `.md` file with relevant documentation topics.

### Adding Images to the Site
Store images inside the `static/images/` directory.
Example folder structure:
```
static/
 ├── images/
 │   ├── diagram.png
 │   ├── logo.png
```
To use images inside a Markdown file:
```md
![Site Diagram](/images/diagram.png)
```

### Configuring Sidebar Navigation
Modify `config.toml` or `config/_default/menus.toml` to define navigation:
```toml
[[menu.main]]
    name = "Getting Started"
    url = "/docs/getting-started/"
    weight = 1

[[menu.main]]
    name = "Setup"
    url = "/docs/setup/"
    weight = 2
```

---

## Running the Hugo Site Locally
To preview the site on `localhost`:
```sh
hugo server --disableFastRender
```
Visit `http://localhost:1313/` in your browser.

---

## Customizing the Hugo Site
### Updating Site Parameters
Modify `config.toml` to update basic site settings like title, author, and theme settings:
```toml
author = "Your Name"
description = "A documentation site powered by Hugo"
```

### Adding a Custom Homepage
Create an `_index.md` inside `content/_index.md`:
```md
---
title: "Welcome to Cloud Mastery Docs"
---

This site provides documentation for cloud infrastructure and automation projects.
```

---

## Building the Site for Deployment
If you want to generate a static version of the site:
```sh
hugo -D
```
This will generate static files inside the `public/` directory.

---

## Conclusion
This guide covers the complete setup and local testing of a Hugo documentation site. You can now start writing and structuring your documentation efficiently!

Next steps:
- Customize the theme further.
- Add more structured documentation.
- Deploy the site to a hosting provider when ready.
