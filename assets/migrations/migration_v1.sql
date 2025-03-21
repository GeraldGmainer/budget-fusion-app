CREATE TABLE IF NOT EXISTS queue_items (
    id TEXT PRIMARY KEY,
    domain TEXT NOT NULL,
    type TEXT NOT NULL,
    entity_payload TEXT NOT NULL,
    attempts INTEGER NOT NULL,
    done INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS profiles (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    name TEXT,
    email TEXT,
    avatar_url TEXT,
    updated_at TEXT
);

CREATE TABLE IF NOT EXISTS accounts (
    id TEXT PRIMARY KEY,
    profile_id TEXT,
    name TEXT NOT NULL,
    icon_name TEXT,
    icon_color TEXT,
    updated_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS categories (
    id TEXT PRIMARY KEY,
    profile_id TEXT,
    name TEXT NOT NULL,
    icon_name TEXT,
    icon_color TEXT,
    category_type TEXT NOT NULL,
    updated_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS bookings (
    id TEXT PRIMARY KEY,
    profile_id TEXT,
    booking_date TEXT NOT NULL,
    description TEXT,
    amount REAL NOT NULL DEFAULT 0,
    category_id TEXT NOT NULL,
    account_id TEXT NOT NULL,
    updated_at TEXT DEFAULT (datetime('now'))
);
