CREATE TABLE IF NOT EXISTS job_referrals (
  id TEXT PRIMARY KEY,
  source_id TEXT,
  company_name TEXT NOT NULL,
  company_logo TEXT,
  industry TEXT NOT NULL,
  recruitment_type TEXT NOT NULL,
  job_categories TEXT NOT NULL,
  cities TEXT NOT NULL,
  job_title TEXT NOT NULL,
  referral_code TEXT,
  apply_url TEXT NOT NULL,
  publish_time TEXT,
  deadline TEXT,
  status TEXT NOT NULL DEFAULT 'active',
  highlights TEXT,
  is_official_sync INTEGER DEFAULT 0,
  dedup_hash TEXT UNIQUE,
  view_count INTEGER DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (source_id) REFERENCES crawler_sources(id) ON DELETE SET NULL
);

CREATE INDEX IF NOT EXISTS idx_jobs_industry ON job_referrals(industry);
CREATE INDEX IF NOT EXISTS idx_jobs_status ON job_referrals(status);
CREATE INDEX IF NOT EXISTS idx_jobs_publish_time ON job_referrals(publish_time DESC);
CREATE INDEX IF NOT EXISTS idx_jobs_official ON job_referrals(is_official_sync);

CREATE TABLE IF NOT EXISTS interview_experiences (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  company_name TEXT NOT NULL,
  position_type TEXT NOT NULL,
  round_tag TEXT,
  question_type TEXT,
  summary TEXT NOT NULL,
  detail_content TEXT NOT NULL,
  points_required INTEGER DEFAULT 5,
  source_platform TEXT,
  source_url TEXT,
  view_count INTEGER DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_exp_company ON interview_experiences(company_name);
CREATE INDEX IF NOT EXISTS idx_exp_position ON interview_experiences(position_type);

CREATE TABLE IF NOT EXISTS resource_materials (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  category TEXT NOT NULL,
  description TEXT,
  file_format TEXT,
  drive_url TEXT NOT NULL,
  access_code TEXT,
  points_required INTEGER DEFAULT 10,
  download_count INTEGER DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_res_category ON resource_materials(category);

CREATE TABLE IF NOT EXISTS user_unlocks (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  target_type TEXT NOT NULL,
  target_id TEXT NOT NULL,
  points_spent INTEGER NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(user_id, target_type, target_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_unlocks_user ON user_unlocks(user_id, target_type);
