# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a static HTML bookshop website ("Buchladen") with German language content. The site is built with plain HTML and CSS, featuring a modern, mobile-responsive design with light pastel colors. No JavaScript or backend functionality is used.

## File Structure

The project consists of:
- **buchlad.html** - Main landing page with featured book and category table
- **booksindex.html** - Book listing page with two tables (by author and by title)
- **books.html** - Individual book detail page template
- **bookcategory.html** - Category listing page showing books in a specific genre
- **css/styles.css** - All styling with pastel color scheme and responsive design
- **bucher/** - Image directory containing book covers and background images

## Page Architecture

### Navigation Structure
All pages share a consistent header with navigation:
- Startseite (Home) → buchlad.html
- Bücher (Books) → booksindex.html

### Page-Specific Backgrounds
Each page uses a different background image set via inline styles:
- buchlad.html: bookstore_bg.png (default from CSS)
- booksindex.html: bookshop_interior_4.png
- books.html: bookshop_interior_3.png
- bookcategory.html: bookshop_interior_2.png

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

When adding book content:
- Use table rows for lists (booksindex.html, bookcategory.html)
- Use `.book-detail` structure for individual book pages
- Link detail pages to books.html (template)
- Include ISBN, price (CHF), author, and year where appropriate
