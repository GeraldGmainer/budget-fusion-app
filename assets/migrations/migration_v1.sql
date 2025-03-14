CREATE TABLE profiles (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    name TEXT,
    email TEXT,
    avatar_url TEXT,
    updated_at TEXT
);

CREATE TABLE IF NOT EXISTS queue_items (
    id TEXT PRIMARY KEY,
    domain TEXT NOT NULL,
    type TEXT NOT NULL,
    entity_payload TEXT NOT NULL,
    attempts INTEGER NOT NULL,
    done INTEGER NOT NULL
);