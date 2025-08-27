#!/bin/bash

# List of files to update
files=(
    "ai-calling-agent-india.html"
    "automotive-ai-calling-agent.html" 
    "bahrain-ai-calling-agent.html"
    "education-ai-calling-agent.html"
    "financial-services-ai-calling-agent.html"
    "hospitality-tourism-ai-calling-agent.html"
    "insurance-ai-calling-agent.html"
    "legal-services-ai-calling-agent.html"
    "manufacturing-ai-calling-agent.html"
    "nonprofit-ai-calling-agent.html"
    "saas-technology-ai-calling-agent.html"
    "saudi-arabia-ai-calling-agent.html"
    "privacy-policy.html"
    "refund-policy.html"
    "service.html"
    "terms-conditions.html"
    "shipping-policy.html"
    "industries.html"
    "use-cases.html"
    "voice-search-optimization.html"
    "performance-optimization.html"
    "blog.html"
)

# Update navigation Book Demo links to Sign In
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "Updating navigation in $file..."
        sed -i 's|href="./enquiry.html">Book Demo|href="https://app.bolgini.com/bolgini/login.html">Sign In|g' "$file"
        sed -i 's|href="enquiry.html">Book Demo|href="https://app.bolgini.com/bolgini/login.html">Sign In|g' "$file"
    fi
done

# Update other Book Demo links to Sign In or Start Free Trial  
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "Updating other links in $file..."
        sed -i 's|href="./enquiry.html">Book Demo|href="https://app.bolgini.com/bolgini/login.html">Sign In|g' "$file"
        sed -i 's|href="enquiry.html">Book Demo|href="https://app.bolgini.com/bolgini/login.html">Sign In|g' "$file"
    fi
done

echo "Link updates completed!"
