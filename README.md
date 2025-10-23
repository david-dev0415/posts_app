# 🌱 Carbon Mitigation Standards Portal

A full-stack web application for managing public consultations on CO₂ mitigation standards and protocols. This platform enables standards organizations to publish draft methodologies for public review and collect structured feedback from stakeholders.

> ⚠️ **Note: This project is currently under active development**
> 
> This README documents the planned architecture and features. The components are not complete. The project structure and APIs may evolve during development.

## 🚀 Features

### 🌐 Public Features
- **Bilingual Content** - All content available in English and Spanish
- **Document Downloads** - Access to draft protocols and methodologies
- **Public Comments** - Structured feedback submission with user details
- **Time-bound Consultations** - Automatic closing after review period (typically 30 days)

### 🔐 Admin Features
- **Consultation Management** - Create, edit, and publish new consultations
- **Comment Moderation** - Review and manage submitted comments
- **User Management** - Administrative access control
- **Analytics** - View consultation statistics and engagement metrics

## 🛠 Tech Stack

### Frontend
- ⚡ **React 19** with TypeScript
- 🎨 **Vite** for fast development and building
- 🌐 **React Router** for navigation
- 💅 **UiShadcn** and **Tailwindcss** for styling
- 🔄 **React Query** for server state management

### Backend
- 🟢 **Node.js** with Express.js
- 🗄 **PostgreSQL** for relational data storage
- 🔐 **JWT** for authentication
- 📧 **Nodemailer** for email notifications
- 📄 **Multer** for file uploads

### Infrastructure
- 🐳 **Docker** & **Docker Compose** for containerization
- 🌐 **Nginx** as reverse proxy
- 📦 **PM2** for process management (production)

## 📁 Project Structure

```
posts_app/
├── 📄 docker-compose.yml
├── 📁 frontend/
│   ├── 📄 Dockerfile
│   ├── 📄 package.json
│   ├── 📁 src/
│   │   ├── 📁 components/
│   │   ├── 📁 pages/
│   │   ├── 📁 hooks/
│   │   └── 📁 utils/
│   └── 📄 vite.config.ts
├── 📁 backend/
│   ├── 📄 Dockerfile
│   ├── 📄 package.json
│   ├── 📁 src/
│   │   ├── 📁 controllers/
│   │   ├── 📁 models/
│   │   ├── 📁 routes/
│   │   ├── 📁 middleware/
│   │   └── 📁 utils/
│   └── 📄 server.js
├── 📁 nginx/
│   ├── 📄 Dockerfile
│   └── 📄 nginx.conf
└── 📁 database/
    ├── 📄 init-scripts/
    └── 📄 migrations/
```

## 🗄 Database Schema

### Main Entities
- **Consultations** - Public consultation records with bilingual content
- **Comments** - User feedback submissions
- **Users** - Admin and moderator accounts
- **Documents** - Protocol files and attachments

### Key Relationships
- Consultations have multiple Comments
- Each Comment belongs to one Consultation
- Users can create Consultations and moderate Comments

## 🚀 Quick Start

### Prerequisites
- Docker & Docker Compose
- Node.js 18+ (for development)

### Development Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/david-dev0415/posts_app
   cd posts_app
   ```

2. **Environment Configuration**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

3. **Start with Docker**
   ```bash
   docker compose up -d --build
   ```

4. **Access the application**
   - Frontend: http://localhost
   - Backend API: http://localhost/api
   - PostgreSQL: localhost:5432

### Manual Development Setup

1. **Backend Setup**
   ```bash
   cd backend_posts_app
   npm install
   npm run dev
   ```

2. **Frontend Setup**
   ```bash
   cd frontend_posts_app
   npm install
   npm run dev
   ```

## 📋 API Endpoints

### Public Endpoints
- `GET /api/consultations` - List active consultations
- `GET /api/consultations/:id` - Get consultation details
- `POST /api/comments` - Submit a comment
- `GET /api/documents/:id` - Download document

### Admin Endpoints
- `POST /api/admin/consultations` - Create new consultation
- `GET /api/admin/comments` - List all comments
- `PUT /api/admin/comments/:id` - Moderate comment
- `GET /api/admin/analytics` - Consultation statistics

## 🐳 Docker Commands

```bash
# Start all services
docker compose up -d

# Stop all services
docker compose down

# View logs
docker compose logs -f

# Rebuild specific service
docker compose build frontend --no-cache

# Database operations
docker compose exec postgres psql -U app_user -d carbon_standards
```

## 🔧 Configuration

### Environment Variables
```env
# Database
DB_HOST=postgres
DB_PORT=5432
DB_NAME=carbon_standards
DB_USER=app_user
DB_PASSWORD=your_secure_password

# JWT
JWT_SECRET=your_jwt_secret
JWT_EXPIRES_IN=7d

# Email (optional)
SMTP_HOST=your_smtp_host
SMTP_PORT=587
SMTP_USER=your_smtp_user
SMTP_PASS=your_smtp_password
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## 🛣 Roadmap

- [ ] User registration and profiles
- [ ] Advanced comment filtering and search
- [ ] Email notifications for new consultations
- [ ] PDF document preview
- [ ] Advanced analytics dashboard
- [ ] API rate limiting
- [ ] Two-factor authentication for admins

## 📞 Support

For support and questions, please contact the development team or create an issue in the repository.

---

**Built with ❤️ for a sustainable future** 🌍