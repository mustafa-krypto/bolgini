# Bolgini Contact Forms Server

A robust Node.js server for handling multiple contact form types with AI-based spam detection for the Bolgini AI Calling Agent website.

## Features

🛡️ **AI-Based Spam Detection**: Intelligent filtering using pattern recognition and heuristics  
📝 **Multiple Form Types**: Support for contact, demo requests, pricing inquiries, and quick contact  
⚡ **Rate Limiting**: Prevents spam and abuse with configurable limits  
📧 **Smart Email Composition**: Context-aware email formatting based on form type  
🔍 **Field Validation**: Comprehensive validation for all form inputs  
🚀 **Easy Deployment**: Simple setup with environment variables  

## Supported Form Types

### 1. Contact Form (`/contact-form`)
- Fields: name, email, phone, company, inquiry_type, message
- Used on: Contact page, general inquiries

### 2. Demo Request (`/demo-request`)
- Fields: name, email, company, phone, industry, message
- Used on: Enquiry page, demo booking
- **Required**: company, industry

### 3. Pricing Inquiry (`/pricing-inquiry`)
- Fields: name, email, phone, plan_interest, message
- Used on: Pricing page
- **Required**: phone number

### 4. Quick Contact (`/quick-contact`)
- Fields: name, email, phone, message
- Used on: Footer forms, sidebar forms
- **Priority**: Fast response time

## Setup Instructions

### 1. Install Dependencies
```bash
npm install
```

### 2. Configure Environment
```bash
cp .env.example .env
```

Edit `.env` with your email credentials:
```env
EMAIL_USER=your-gmail@gmail.com
EMAIL_PASS=your-app-password
TO_EMAIL=info@bolgini.com
PORT=3191
```

### 3. Gmail App Password Setup
1. Enable 2-Factor Authentication on your Gmail account
2. Go to Google Account Settings > Security > App passwords
3. Generate an app password for "Mail"
4. Use this app password in `EMAIL_PASS`

### 4. Start the Server
```bash
# Production
npm start

# Development (with auto-reload)
npm run dev
```

## API Endpoints

### POST `/contact-form`
General contact form submission
```json
{
  "name": "John Doe",
  "emailid": "john@company.com",
  "phone": "+1234567890",
  "company": "ACME Corp",
  "inquiry_type": "demo",
  "msg": "Interested in AI calling solutions"
}
```

### POST `/demo-request`
Demo booking form
```json
{
  "name": "Jane Smith",
  "emailid": "jane@business.com",
  "company": "Business Inc",
  "phone": "+1234567890",
  "industry": "healthcare",
  "msg": "Need demo for patient communication"
}
```

### POST `/pricing-inquiry`
Pricing information request
```json
{
  "name": "Bob Johnson",
  "emailid": "bob@startup.com",
  "phone": "+1234567890",
  "plan_interest": "professional",
  "msg": "Need custom pricing for 1000+ calls"
}
```

### POST `/quick-contact`
Quick contact form (footer/sidebar)
```json
{
  "name": "Alice Brown",
  "emailid": "alice@company.com",
  "phone": "+1234567890",
  "msg": "Quick question about integration"
}
```

### GET `/health`
Health check endpoint
```json
{
  "status": "OK",
  "timestamp": "2025-06-19T12:00:00.000Z",
  "service": "Bolgini Contact Forms API"
}
```

## Spam Detection Features

The AI-based spam detection system checks for:

- 🚫 **Spam Keywords**: Common spam terms and phrases
- 📏 **Content Length**: Suspicious short/long content
- 🔗 **URL Detection**: Excessive links in messages
- 🔤 **Character Patterns**: Repetitive characters, excessive caps
- 🍯 **Honeypot Fields**: Hidden fields to catch bots
- 📊 **Scoring System**: Weighted scoring for spam probability

## Rate Limiting

- **Window**: 15 minutes
- **Limit**: 5 requests per IP
- **Response**: 429 Too Many Requests

## Email Templates

Each form type generates customized emails with:

- 📋 **Structured Information**: Organized field display
- 🎯 **Action Items**: Specific next steps for team
- ⏰ **Response Timeframes**: Expected response times
- 🔍 **Technical Details**: IP, timestamp, source tracking

## Frontend Integration

Update your HTML forms to point to the new endpoints:

```html
<!-- Contact Form -->
<form method="POST" action="http://localhost:3191/contact-form">
  <!-- form fields -->
</form>

<!-- Demo Request -->
<form method="POST" action="http://localhost:3191/demo-request">
  <!-- form fields -->
</form>

<!-- Pricing Inquiry -->
<form method="POST" action="http://localhost:3191/pricing-inquiry">
  <!-- form fields -->
</form>

<!-- Quick Contact -->
<form method="POST" action="http://localhost:3191/quick-contact">
  <!-- form fields -->
</form>
```

## Production Deployment

### Using PM2
```bash
npm install -g pm2
pm2 start server.js --name "bolgini-forms"
pm2 startup
pm2 save
```

### Using Docker
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
EXPOSE 3191
CMD ["npm", "start"]
```

### Environment Variables
```env
NODE_ENV=production
EMAIL_USER=your-production-email@gmail.com
EMAIL_PASS=your-production-app-password
TO_EMAIL=info@bolgini.com
PORT=3191
```

## Monitoring & Logs

The server logs:
- ✅ Successful form submissions
- 🚫 Spam detection triggers
- ❌ Error messages
- 📊 Rate limiting events

## Troubleshooting

### Common Issues

1. **Email not sending**
   - Check Gmail app password is correct
   - Verify 2FA is enabled on Gmail
   - Check firewall/network restrictions

2. **Forms returning errors**
   - Verify all required fields are included
   - Check field name spelling matches server expectations
   - Ensure email format is valid

3. **Rate limiting issues**
   - Check if IP is making too many requests
   - Consider adjusting rate limits in production
   - Implement user feedback for rate limits

### Debug Mode
Set `NODE_ENV=development` in `.env` for verbose logging.

## Security Considerations

- ✅ Input validation and sanitization
- ✅ Rate limiting and abuse prevention
- ✅ Spam detection and filtering
- ✅ Environment variable configuration
- ✅ Error handling without information leakage

## Support

For issues or questions:
- 📧 Email: info@bolgini.com
- 📱 Phone: +91 98730 62228
- 🌐 Website: https://bolgini.com

---

*Built with ❤️ for Bolgini AI Calling Agent*
