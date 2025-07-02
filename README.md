# Custom LaTeX Buildpack for CV Generation

This is a minimal LaTeX buildpack specifically designed for generating CVs with the exact packages needed.

## Features
- Installs only essential LaTeX packages (small footprint)
- Optimized for CV generation use case
- Based on TeX Live minimal scheme with proper package management
- Includes necessary fonts and packages for CV compilation

## Packages Included
The buildpack automatically installs these essential packages for CV generation:
- geometry (page layout)
- fontawesome5 (icons)
- tcolorbox (colored boxes)
- enumitem (custom lists)
- amsfonts (math fonts)
- hyperref (links)
- setspace (line spacing)
- xcolor (colors)
- pgf (graphics)
- etoolbox (programming tools)

## Usage
1. Push this buildpack to a Git repository
2. Add it as a buildpack to your Heroku app:
   ```bash
   heroku buildpacks:add https://github.com/yourusername/cv-latex-buildpack.git
   heroku buildpacks:add heroku/python
   ```
3. Deploy your app

## Buildpack Detection
This buildpack will be automatically detected if your project contains:
- Any `.tex` files
- A `.latex-buildpack` marker file
- Python files that reference LaTeX/PDF generation

You can also force detection by creating a `.latex-buildpack` file in your project root.

## Essential Files
- `bin/detect` - Determines when this buildpack should be used
- `bin/compile` - Installs TeX Live and required packages  
- `bin/release` - Sets up environment variables and PATH

## What's Fixed
This version addresses common package installation issues by:
- Using the official TeX Live installer instead of TinyTeX
- Proper repository configuration for package management
- Better error handling and verbose output
- Fallback mechanisms for package installation
- Comprehensive testing and verification

## File Structure
- `bin/detect` - Detects if LaTeX is needed
- `bin/compile` - Installs minimal TeX Live with CV packages
- `bin/release` - Sets up environment variables

## Testing
After deployment, you can test the installation by running:
```bash
heroku run /app/test-latex.sh
```

## Size
This buildpack installs approximately 100-200MB of LaTeX packages vs 4GB+ for full TeX Live.
