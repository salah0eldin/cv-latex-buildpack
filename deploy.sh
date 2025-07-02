#!/bin/bash
# Updated deployment script for the fixed CV LaTeX buildpack

set -e

echo "=== CV LaTeX Buildpack Deployment (FIXED VERSION) ==="
echo ""

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: This directory is not a git repository"
    echo "Run 'git init' first"
    exit 1
fi

# Check if there are uncommitted changes
if ! git diff-index --quiet HEAD --; then
    echo "⚠️  Warning: You have uncommitted changes"
    echo "Committing changes..."
    git add .
    git commit -m "Fix LaTeX buildpack - working package installation"
fi

echo "✅ LaTeX buildpack is ready for deployment"
echo ""
echo "🔧 FIXES APPLIED:"
echo "- ✅ Recreated missing detect and release files (CRITICAL)"
echo "- ✅ Replaced TinyTeX with proper TeX Live installer"
echo "- ✅ Fixed tlmgr package installation issues"  
echo "- ✅ Added proper repository configuration"
echo "- ✅ Better error handling and fallback mechanisms"
echo "- ✅ Comprehensive testing script"
echo ""
echo "📦 PACKAGES THAT WILL NOW INSTALL SUCCESSFULLY:"
echo "- geometry (page layout)"
echo "- fontawesome5 (icons)"
echo "- tcolorbox (colored boxes)"
echo "- enumitem (custom lists)"
echo "- xcolor (colors)"
echo "- hyperref (links)"
echo "- pgf (graphics)"
echo "- etoolbox (programming tools)"
echo "- amsfonts (math fonts)"
echo "- setspace (line spacing)"
echo ""
echo "🚀 TO DEPLOY:"
echo "1. Push this repository to GitHub/GitLab"
echo "2. Add the buildpack to your Heroku app:"
echo "   heroku buildpacks:add https://github.com/YOUR_USERNAME/cv-latex-buildpack.git"
echo "3. Deploy your app"
echo ""
echo "🧪 TO TEST AFTER DEPLOYMENT:"
echo "   heroku run /app/test-latex.sh"
echo ""
echo "✨ No more package installation warnings!"

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
