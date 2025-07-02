# Deployment Instructions for cv-latex-buildpack

## Step 1: Create GitHub Repository

1. Go to [GitHub](https://github.com) and sign in as **salah0eldin**
2. Click "New repository" or go to https://github.com/new
3. Repository name: `cv-latex-buildpack`
4. Description: `Heroku buildpack for LaTeX/TinyTeX with minimal portable installation`
5. Make it **Public** (required for Heroku buildpacks)
6. **Do NOT** initialize with README, .gitignore, or license (we already have files)
7. Click "Create repository"

## Step 2: Push to GitHub

Run these commands from the buildpack directory:

```bash
cd /home/salah0eldin/d_drive/Projects/cv-latex-buildpack
git branch -M main
git remote add origin https://github.com/salah0eldin/cv-latex-buildpack.git
git push -u origin main
```

## Step 3: Update Heroku App to Use New Buildpack

Replace `YOUR_HEROKU_APP_NAME` with your actual Heroku app name:

```bash
# Set the new buildpack
heroku buildpacks:clear -a YOUR_HEROKU_APP_NAME
heroku buildpacks:add heroku/python -a YOUR_HEROKU_APP_NAME
heroku buildpacks:add https://github.com/salah0eldin/cv-latex-buildpack.git -a YOUR_HEROKU_APP_NAME

# Purge the build cache to ensure clean installation
heroku builds:cache:purge -a YOUR_HEROKU_APP_NAME

# Deploy the app
git push heroku main
```

## Step 4: Verify Installation

After deployment, test that LaTeX is working:

```bash
# Check if pdflatex is available
heroku run "which pdflatex" -a YOUR_HEROKU_APP_NAME

# Test LaTeX compilation
heroku run "echo '\documentclass{article}\begin{document}Hello LaTeX!\end{document}' > test.tex && pdflatex test.tex" -a YOUR_HEROKU_APP_NAME
```

## Step 5: Test Your CV Generator

1. Open your Heroku app URL
2. Submit a CV generation request
3. Verify that PDF generation works without "pdflatex not found" errors

## Troubleshooting

If you encounter issues:

1. Check the build logs: `heroku logs --tail -a YOUR_HEROKU_APP_NAME`
2. Verify buildpack order: `heroku buildpacks -a YOUR_HEROKU_APP_NAME`
3. Ensure the repository is public on GitHub
4. Check that all files have proper permissions (executable for bin/* files)

## Repository Structure

Your buildpack should have this structure:
```
cv-latex-buildpack/
├── README.md
├── bin/
│   ├── compile       # Main compilation script (TinyTeX installer)
│   ├── detect        # Detects if buildpack should be used
│   └── release       # Sets up PATH for TinyTeX
├── compile-old       # Backup of previous versions
└── compile-new       # Alternative implementation
```

The buildpack installs TinyTeX (a minimal LaTeX distribution) and required packages:
- pdflatex
- xetex
- luatex
- geometry package
- fontenc package
- inputenc package
- And other essential LaTeX packages

This should resolve the "pdflatex command not found" error on Heroku.
