CREATE TABLE IF NOT EXISTS crawler_sources (
  id TEXT PRIMARY KEY,
  company_name TEXT NOT NULL UNIQUE,
  category TEXT NOT NULL,
  portal_url TEXT NOT NULL,
  api_endpoint TEXT,
  parser_type TEXT NOT NULL,
  crawler_config TEXT DEFAULT '{}',
  status TEXT NOT NULL DEFAULT 'active',
  sync_frequency_minutes INTEGER DEFAULT 120,
  last_sync_at TEXT,
  last_job_count INTEGER DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_crawler_category ON crawler_sources(category);
CREATE INDEX IF NOT EXISTS idx_crawler_status ON crawler_sources(status);
