---
title: "Priya's Portfolio"
linkTitle: "Priya-Portfolio on Vercel"
weight: 2
menu:
  main:
    parent: "Documents"
    weight: 2
---

![Vercel](../../images/vercel.svg)

## Introduction
This guide provides a detailed, step-by-step process for deploying **Priya-Portfolio** on Vercel, ensuring a smooth and efficient setup. It covers everything from **initial project setup** to **automating deployments via GitHub**, along with configuring a **custom domain**. Whether you're looking to establish a robust deployment pipeline or enhance your portfolio's visibility, this documentation will serve as a complete reference.

### Tech Stack Used
Priya-Portfolio is built using **Next.js**, **Tailwind CSS**, and **Vercel** for deployment. Tailwind CSS is used for rapid UI development with utility-first styling. The project leverages:
- **Next.js** for a fast, SEO-friendly React framework.
- **Tailwind CSS** for styling with a utility-first approach.
- **Framer Motion** for animations and UI transitions.
- **React Icons** for scalable SVG icons.
- **GitHub Actions** for CI/CD integration.
- **Vercel** for deployment and automatic updates on `main` branch commits.

This stack ensures a modern, responsive, and easily maintainable portfolio.

---

## 1. Setting Up the Project Locally

### Clone the GitHub Repository
If the project has not been cloned yet, use the following command:
```sh
git clone https://github.com/Priya-coding/priya-portfolio.git
cd priya-portfolio
```

### Install Dependencies
Run the following command to install all required dependencies:
```sh
npm install
```

### Test Locally Before Deployment
Start the development server to ensure everything runs as expected:
```sh
npm run dev
```
Once started, the portfolio will be accessible at `http://localhost:3000`.

---

## 2. Deploying Priya-Portfolio to Vercel

### Install Vercel CLI
Ensure Vercel CLI is installed globally:
```sh
npm install -g vercel
```

### Login to Vercel
Authenticate with Vercel using the command:
```sh
vercel login
```
Follow the instructions to complete authentication.

### Initialize Vercel Deployment
Navigate to the project directory and execute:
```sh
vercel
```
Follow the prompts:
- Select **"Create a new project"** if deploying for the first time.
- Enter the project name as **priya-portfolio**.
- Accept the default settings for **framework detection and deployment options**.
- Confirm the deployment when prompted.

Upon successful deployment, Vercel will generate a URL such as:
```
https://priya-portfolio-xyz.vercel.app
```

---

## 3. Enabling Auto-Deployment from GitHub

### Connect GitHub Repository to Vercel
1. Go to [Vercel Dashboard](https://vercel.com/dashboard).
2. Select the **priya-portfolio** project.
3. Navigate to **Settings → Git**.
4. Connect the GitHub repository **Priya-Portfolio**.
5. Enable **"Automatically Deploy on Push"**.
6. Set the **Production Branch** to `main`.

### Push Changes to Trigger Auto-Deployment
After linking GitHub, push code changes to `main` to verify auto-deployment:
```sh
git add .
git commit -m "Initial Vercel Deployment"
git push origin main
```
Each push to `main` will now trigger an automatic deployment on Vercel.

---

## 4. Configuring a Custom Domain

### Rename Project for a Cleaner URL
1. Open the **Vercel Dashboard**.
2. Navigate to **Settings → General**.
3. Edit the **Project Name** to `priya-portfolio`.
4. Save changes.

### Assign a Custom Domain
1. Go to **Vercel Dashboard → Settings → Domains**.
2. Click **"Add Domain"** and enter:
```
priyarani-portfolio.vercel.app
```
3. Assign the new domain and remove the old one.
4. Redeploy the project:
```sh
vercel --prod
```
Once completed, the portfolio will be accessible at:
```
https://priyarani-portfolio.vercel.app/
```

---

## 5. Troubleshooting Common Deployment Issues

### Next.js Version Not Detected
**Error:** "No Next.js version could be detected in your project."

**Solution:**
```sh
npm install next@latest react@latest react-dom@latest
rm -rf node_modules package-lock.json
npm install
```
Retry deployment:
```sh
vercel --prod
```

### Auto-Deploy Not Triggering
If GitHub push is not triggering a deployment:
1. Verify that the repository is connected in **Vercel → Settings → Git**.
2. Manually trigger deployment with an empty commit:
```sh
git commit --allow-empty -m "Trigger deployment"
git push origin main
```

### Manual Redeployment
If auto-deployment fails, manually redeploy from:
```
Vercel Dashboard → Deployments → Redeploy
```
Alternatively, use the CLI:
```sh
vercel --prod
```

---

## 6. Portfolio Preview
For a visual representation of the portfolio, here is a screenshot of the front page of my portfolio:

![Portfolio Screenshot](../../images/portfolio_frontpage.png)

## 7. Summary
- Successfully **set up and deployed Priya-Portfolio** on Vercel.
- Enabled **auto-deployment on push to `main`**.
- Configured **a cleaner project URL**.
- Troubleshot common deployment issues.

This guide serves as a **comprehensive reference for deploying and maintaining Priya-Portfolio on Vercel**.

View the live portfolio: [Priya-Portfolio](https://priyarani-portfolio.vercel.app/). The setup ensures **seamless updates, efficient deployment workflows, and a professional online presence** for Priya's portfolio.

For further improvements or customization, the deployment process can be refined based on additional requirements.
