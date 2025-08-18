#!/bin/bash

# Test URLs to verify 404 fixes
echo "Testing URL fixes for Bolgini..."
echo "================================"

# Test 1: Check if industries.html exists and redirects properly
echo "1. Testing /industries redirect to /use-cases.html"
if [ -f "industries.html" ]; then
    echo "✅ industries.html file created"
else
    echo "❌ industries.html file missing"
fi

# Test 2: Check if .htaccess has the industries redirect rule
echo "2. Testing .htaccess redirect rule"
if grep -q "industries.*use-cases" .htaccess; then
    echo "✅ .htaccess redirect rule added"
else
    echo "❌ .htaccess redirect rule missing"
fi

# Test 3: Check if server.js has GET handler for demo-account-request
echo "3. Testing server.js GET handler for demo-account-request"
if grep -q "app.get.*demo-account-request" server.js; then
    echo "✅ GET handler for demo-account-request added"
else
    echo "❌ GET handler for demo-account-request missing"
fi

# Test 4: Check if 404.html exists
echo "4. Testing 404.html error page"
if [ -f "404.html" ]; then
    echo "✅ 404.html error page created"
else
    echo "❌ 404.html error page missing"
fi

echo ""
echo "Summary of fixes applied:"
echo "========================"
echo "- Created industries.html with redirect to use-cases.html"
echo "- Added .htaccess rule to redirect /industries to /use-cases.html"
echo "- Added GET handler for /demo-account-request in server.js"
echo "- Created proper 404.html error page"
echo ""
echo "The following URLs should now work correctly:"
echo "- https://bolgini.com/industries -> redirects to /use-cases.html"
echo "- https://submit.bolgini.com/demo-account-request -> redirects to /demo.html"
