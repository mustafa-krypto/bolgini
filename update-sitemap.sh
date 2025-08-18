#!/bin/bash

# Update sitemap lastmod dates to current date
# This script helps ensure Google sees fresh content

current_date=$(date +%Y-%m-%d)

echo "Updating sitemap.xml with current date: $current_date"

# Update main pages
sed -i "s/<lastmod>2025-06-06<\/lastmod>/<lastmod>$current_date<\/lastmod>/g" sitemap.xml

# Update blog pages  
sed -i "s/<lastmod>2025-01-09<\/lastmod>/<lastmod>$current_date<\/lastmod>/g" sitemap.xml

echo "Sitemap updated successfully!"

# Test some key URLs to ensure they resolve correctly
echo ""
echo "Testing key URLs (if curl is available):"

urls=(
    "https://bolgini.com/contact.html"
    "https://bolgini.com/demo.html" 
    "https://bolgini.com/features.html"
    "https://bolgini.com/pricing.html"
    "https://bolgini.com/about.html"
    "https://bolgini.com/use-cases.html"
)

for url in "${urls[@]}"; do
    if command -v curl &> /dev/null; then
        status=$(curl -s -o /dev/null -w "%{http_code}" "$url")
        if [ "$status" = "200" ]; then
            echo "✓ $url - OK"
        else
            echo "✗ $url - Status: $status"
        fi
    else
        echo "? $url - curl not available"
    fi
done

echo ""
echo "Next steps:"
echo "1. Push changes to GitHub"
echo "2. Submit updated sitemap.xml to Google Search Console"
echo "3. Request re-indexing for failed URLs"
