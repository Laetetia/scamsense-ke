-- =====================================================
-- ScamSense KE Database Schema
-- Database: MySQL
-- =====================================================

-- Create the database
CREATE DATABASE IF NOT EXISTS scamsense_ke;

-- Select the database
USE scamsense_ke;

-- =====================================================
-- 1. USERS TABLE
-- =====================================================

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('USER', 'ADMIN') DEFAULT 'USER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =====================================================
-- 2. SUBMISSIONS TABLE
-- =====================================================

CREATE TABLE submissions (
    submission_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    submission_type ENUM(
        'MESSAGE',
        'URL',
        'ADVERTISEMENT'
    ) NOT NULL,
    submitted_content TEXT NOT NULL,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM(
        'PENDING',
        'PROCESSING',
        'COMPLETED',
        'FAILED'
    ) DEFAULT 'PENDING',

    CONSTRAINT fk_submission_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    INDEX idx_submission_user (user_id),
    INDEX idx_submission_date (submitted_at)
) ENGINE=InnoDB;

-- =====================================================
-- 3. ANALYSIS RESULTS TABLE
-- =====================================================

CREATE TABLE analysis_results (
    analysis_id INT AUTO_INCREMENT PRIMARY KEY,
    submission_id INT NOT NULL,
    risk_level ENUM(
        'LOW',
        'MODERATE',
        'HIGH',
        'INSUFFICIENT_EVIDENCE'
    ) NOT NULL,
    explanation TEXT NOT NULL,
    recommendations TEXT,
    confidence_score DECIMAL(5,4),
    analysed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_analysis_submission
        FOREIGN KEY (submission_id)
        REFERENCES submissions(submission_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT chk_confidence_score
        CHECK (
            confidence_score IS NULL
            OR confidence_score BETWEEN 0 AND 1
        ),

    INDEX idx_analysis_submission (submission_id),
    INDEX idx_analysis_risk (risk_level)
) ENGINE=InnoDB;

-- =====================================================
-- 4. SCAM PATTERNS TABLE
-- =====================================================

CREATE TABLE scam_patterns (
    pattern_id INT AUTO_INCREMENT PRIMARY KEY,
    pattern_name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    pattern_category VARCHAR(100) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_pattern_category (pattern_category),
    INDEX idx_pattern_active (is_active)
) ENGINE=InnoDB;

-- =====================================================
-- 5. ANALYSIS PATTERN MATCHES TABLE
-- =====================================================

CREATE TABLE analysis_pattern_matches (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    analysis_id INT NOT NULL,
    pattern_id INT NOT NULL,
    evidence TEXT NOT NULL,

    CONSTRAINT fk_match_analysis
        FOREIGN KEY (analysis_id)
        REFERENCES analysis_results(analysis_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_match_pattern
        FOREIGN KEY (pattern_id)
        REFERENCES scam_patterns(pattern_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT unique_analysis_pattern
        UNIQUE (analysis_id, pattern_id)
) ENGINE=InnoDB;

-- =====================================================
-- 6. REPORTS TABLE
-- =====================================================

CREATE TABLE reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    submission_id INT NOT NULL,
    report_description TEXT NOT NULL,
    report_status ENUM(
        'PENDING',
        'UNDER_REVIEW',
        'RESOLVED'
    ) DEFAULT 'PENDING',
    reported_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_report_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_report_submission
        FOREIGN KEY (submission_id)
        REFERENCES submissions(submission_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    INDEX idx_report_status (report_status)
) ENGINE=InnoDB;