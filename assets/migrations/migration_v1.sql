CREATE TABLE IF NOT EXISTS queue_items (
    entity_id TEXT PRIMARY KEY,
    entity_payload TEXT NOT NULL,
    domain TEXT NOT NULL,
    type TEXT NOT NULL,
    attempts INTEGER NOT NULL,
    done INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS profile (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    name TEXT,
    email TEXT,
    avatar_url TEXT,
    updated_at TEXT
);

CREATE TABLE IF NOT EXISTS profile_setting (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    currency TEXT NOT NULL,
    updated_at TEXT
);

CREATE TABLE IF NOT EXISTS account (
    id TEXT PRIMARY KEY,
    user_id TEXT,
    name TEXT NOT NULL,
    icon_name TEXT,
    icon_color TEXT,
    updated_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS category (
    id TEXT PRIMARY KEY,
    user_id TEXT,
    name TEXT NOT NULL,
    icon_name TEXT,
    icon_color TEXT,
    category_type TEXT NOT NULL,
    updated_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS booking (
    id TEXT PRIMARY KEY,
    user_id TEXT,
    date TEXT NOT NULL,
    description TEXT,
    amount REAL NOT NULL DEFAULT 0,
    category_id TEXT NOT NULL,
    account_id TEXT NOT NULL,
    updated_at TEXT DEFAULT (datetime('now'))
);
