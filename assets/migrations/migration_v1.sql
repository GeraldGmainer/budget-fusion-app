CREATE TABLE profiles (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  name TEXT,
  email TEXT,
  avatar_url TEXT,
  updated_at TEXT
);