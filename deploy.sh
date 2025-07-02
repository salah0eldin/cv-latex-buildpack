#!/bin/bash

# Quick Deployment Script for cv-latex-buildpack
# Run this script after creating the GitHub repository

set -e

echo "🚀 CV LaTeX Buildpack Deployment Script"
echo "========================================"

# Check if we're in the right directory
if [ ! -f "bin/compile" ]; then
    echo "❌ Error: Please run this script from the cv-latex-buildpack directory"
    echo "   cd /home/salah0eldin/d_drive/Projects/cv-latex-buildpack"
    exit 1
fi

echo "📋 Current directory: $(pwd)"
echo "📁 Files in repository:"
ls -la

echo ""
echo "🔧 Step 1: Setting up git repository..."
git branch -M main

echo ""
echo "📤 Step 2: Adding GitHub remote..."
if git remote get-url origin > /dev/null 2>&1; then
    echo "   Remote 'origin' already exists"
    git remote set-url origin https://github.com/salah0eldin/cv-latex-buildpack.git
else
    git remote add origin https://github.com/salah0eldin/cv-latex-buildpack.git
fi

echo ""
echo "⬆️  Step 3: Pushing to GitHub..."
echo "   Pushing to: $(git remote get-url origin)"
git push -u origin main

echo ""
echo "✅ Buildpack successfully pushed to GitHub!"
echo ""
echo "🎯 Next Steps:"
echo "1. Update your Heroku app to use this buildpack:"
echo "   heroku buildpacks:clear -a YOUR_APP_NAME"
echo "   heroku buildpacks:add heroku/python -a YOUR_APP_NAME"
echo "   heroku buildpacks:add https://github.com/salah0eldin/cv-latex-buildpack.git -a YOUR_APP_NAME"
echo ""
echo "2. Purge build cache and redeploy:"
echo "   heroku builds:cache:purge -a YOUR_APP_NAME"
echo "   cd /path/to/your/cv_generator/app"
echo "   git push heroku main"
echo ""
echo "3. Test LaTeX installation:"
echo "   heroku run 'which pdflatex' -a YOUR_APP_NAME"
echo ""
echo "🔗 Buildpack URL: https://github.com/salah0eldin/cv-latex-buildpack"
echo "📖 Full instructions: See DEPLOY.md"
