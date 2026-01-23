# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a static HTML bookshop website ("Buchladen") with German language content. The site is built with plain HTML and CSS, featuring a modern, mobile-responsive design with light pastel colors. No JavaScript or backend functionality is used.

## File Structure

The project consists of:
- **index.html** - Main landing page with featured book and category table
- **booksindex.html** - Book listing page with two tables (by author and by title)
- **books.html** - Individual book detail page template (not used directly)
- **books001.html, books002.html, etc.** - Individual book detail pages (numbered sequentially)
- **bookcategory.html** - Category listing page template (not used directly)
- **category01.html through category06.html** - Category pages for each book category
- **css/styles.css** - All styling with pastel color scheme and responsive design
- **bucher/** - Image directory containing book covers and background images

### Active Categories
1. **category01.html** - Ökonomie (Economics)
2. **category02.html** - Geschichte (History)
3. **category03.html** - Sprachen (Languages)
4. **category04.html** - Romane (Novels)
5. **category05.html** - Science Fiction
6. **category06.html** - Schwimmen (Swimming)

## Page Architecture

### Navigation Structure
All pages share a consistent header with navigation:
- Startseite (Home) → index.html
- Inhaltsverzeichnis (Table of Contents) → booksindex.html

### Page-Specific Backgrounds
Each page uses a different background image set via inline styles:
- index.html: bookstore_bg.png (default from CSS)
- booksindex.html: bookshop_interior_4.png
- books*.html: bookshop_interior_3.png
- category*.html: bookshop_interior_2.png

All backgrounds use: `background-size: cover; background-attachment: fixed; background-position: center;`

## CSS Design System

The styles.css uses CSS custom properties for consistent theming:

```css
--color-bg-primary: #FFFDF5 (Creamy White)
--color-bg-secondary: #E3F2FD (Soft Pastel Blue)
--color-accent: #B2DFDB (Pastel Mint)
--color-text-primary: #37474F (Dark Blue Grey)
--color-text-secondary: #546E7A (Medium Blue Grey)
--color-link: #FFAB91 (Soft Coral)
```

### Key Layout Patterns

1. **Semi-transparent content containers**: Use `background-color: rgba(255, 255, 255, 0.85)` to overlay content on background images
2. **Responsive grid for book cards**: `.book-grid` uses `grid-template-columns: repeat(auto-fill, minmax(250px, 1fr))`
3. **Flexible book detail layout**: `.book-detail` uses flexbox that switches from column to row on tablet+ screens
4. **Mobile-first approach**: Base styles are mobile, with `@media (min-width: 768px)` for larger screens

## Design Conventions

- Language: German (lang="de")
- Currency: Swiss Francs (CHF)
- Tables styled with Excel-like appearance (gray borders, minimal padding)
- Hover effects on cards and links
- All interactive elements have `transition` for smooth state changes
- Placeholder images reference `bucher/placeholder.jpg`

## Common Modifications

When adding new pages:
1. Copy the header/footer structure from existing pages
2. Set page-specific background image in `<style>` tag in `<head>`
3. Use `.container` class for proper max-width and centering
4. Wrap main content in semi-transparent white background divs
5. Ensure navigation links are updated with correct active state styling

## Adding New Books

When the user provides book information (usually in a text file), follow this workflow:

### Step 1: Determine the Next Book Number
Check the highest existing books*.html file number and increment by 1 (e.g., if books009.html exists, create books010.html)

### Step 2: Create Book Detail Page
1. Copy books.html structure
2. Fill in book information:
   - Title, Author(s), Year published
   - Book cover image path (bucher/*.jpg)
   - Review/description text
   - ISBN number
   - Amazon purchase link
3. Save as booksXXX.html with next sequential number

### Step 3: Update Category Page
Find the appropriate category file based on the book's category:
- Economics → category01.html
- History → category02.html
- Languages → category03.html
- Novels → category04.html
- Science Fiction → category05.html
- Swimming → category06.html

Add a new table row with the book's thumbnail, title, author, and link to booksXXX.html

### Step 4: Update booksindex.html
Add entries to BOTH tables in alphabetical order:
1. **Autoren table** (Authors): Author name (linked to booksXXX.html) and book title
2. **Buchtitel table** (Titles): Book title (linked to booksXXX.html) and author name

Links should use: `style="color: #0066cc; text-decoration: underline;"`

### Book Information Text File Format
Book info files typically contain:
```
Category: [Category name]
Titel: [Book title]
Autoren: [Author name(s)]
Erschienen: [Year]
Bild: bucher/[image-file.jpg]
Review: [Review text]
ISBN: [ISBN number]
Zum Kaufen: [Amazon URL]
```

### Important Notes
- Do NOT include price information (removed from all pages)
- All book images should be in the bucher/ folder
- Use dark blue (#0066cc) underlined links for author/title links in booksindex.html
- Book detail pages use bookshop_interior_3.png background
- Category pages use bookshop_interior_2.png background
