-- ==============================================
--  Database initialization script
--  Project: Carbon Mitigation Standards Portal (CO₂ Standards)
-- ==============================================

-- Drop existing tables (solo para desarrollo)
DROP TABLE IF EXISTS comments CASCADE;
DROP TABLE IF EXISTS consultations CASCADE;
DROP TABLE IF EXISTS admin_users CASCADE;

-- ============================
-- Table: admin_users
-- ============================
CREATE TABLE admin_users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('admin', 'editor')) DEFAULT 'editor',
    created_at TIMESTAMP DEFAULT NOW()
);

-- ============================
-- Table: consultations
-- ============================
CREATE TABLE consultations (
    id SERIAL PRIMARY KEY,
    title_en VARCHAR(255) NOT NULL,
    title_es VARCHAR(255) NOT NULL,
    description_en TEXT NOT NULL,
    description_es TEXT NOT NULL,
    document_url VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_by INTEGER REFERENCES admin_users(id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- ============================
-- Table: comments
-- ============================
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    consultation_id INTEGER REFERENCES consultations(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL,
    company VARCHAR(150),
    position VARCHAR(100),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- ============================
-- Indexes and constraints
-- ============================
CREATE INDEX idx_consultation_dates ON consultations(start_date, end_date);
CREATE INDEX idx_comments_consultation_id ON comments(consultation_id);
CREATE INDEX idx_admin_email ON admin_users(email);