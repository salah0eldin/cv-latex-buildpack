# Custom LaTeX Buildpack for CV Generation

This is a minimal LaTeX buildpack specifically designed for generating CVs with the exact packages needed.

## Features
- Installs only essential LaTeX packages (small footprint)
- Optimized for CV generation use case
- Based on TeX Live minimal scheme
- Includes only necessary fonts and packages

## Packages Included
- geometry (page layout)
- fontawesome5 (icons)
- tcolorbox (colored boxes)
- enumitem (custom lists)
- psnfss (PostScript fonts)
- amsfonts (math fonts)
- hyperref (links)
- setspace (line spacing)
- xcolor (colors)
- pgf (graphics)
- etoolbox (programming tools)
- l3backend/l3kernel/l3packages (LaTeX3 support)

## Usage
1. Push this buildpack to a Git repository
2. Add it as a buildpack to your Heroku app:
   ```bash
   heroku buildpacks:add https://github.com/yourusername/cv-latex-buildpack.git
   heroku buildpacks:add heroku/python
   ```
3. Deploy your app

## File Structure
- `bin/detect` - Detects if LaTeX is needed
- `bin/compile` - Installs minimal LaTeX
- `bin/release` - Sets up environment variables

## Size
This buildpack installs approximately 50-100MB of LaTeX packages vs 400MB+ for full TeX Live.
