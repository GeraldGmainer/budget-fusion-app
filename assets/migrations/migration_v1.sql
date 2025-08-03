CREATE TABLE IF NOT EXISTS queue_items (
    entity_id TEXT PRIMARY KEY,
    entity_payload TEXT NOT NULL,
    entity_type TEXT NOT NULL,
    task_type TEXT NOT NULL,
    attempts INTEGER NOT NULL,
    done INTEGER NOT NULL
);

CREATE TABLE currency
(
    id                  TEXT PRIMARY KEY,
    name                TEXT,
    decimal_precision   INTEGER,
    unit_position_front INTEGER,
    symbol              TEXT  ,
    ui_order            INTEGER
);

CREATE TABLE IF NOT EXISTS profile (
    id TEXT PRIMARY KEY,
    email TEXT,
    first_name TEXT,
    last_name TEXT,
    avatar_url TEXT,
    settings TEXT,
    updated_at TEXT,
    sync_status TEXT    NOT NULL DEFAULT 'synced',
    last_synced_at TEXT,
    modified_locally_at TEXT
);

CREATE TABLE IF NOT EXISTS profile (
    id TEXT PRIMARY KEY,
    email TEXT,
    first_name TEXT,
    last_name TEXT,
    avatar_url TEXT,
    settings TEXT,
    updated_at TEXT,
    sync_status TEXT    NOT NULL DEFAULT 'synced',
    last_synced_at TEXT,
    modified_locally_at TEXT
);

CREATE TABLE IF NOT EXISTS account (
    id TEXT PRIMARY KEY,
    name TEXT        NOT NULL,
    icon_name TEXT,
    icon_color TEXT,
    updated_at TEXT,
    sync_status TEXT    NOT NULL DEFAULT 'synced',
    last_synced_at TEXT,
    modified_locally_at TEXT
);

CREATE TABLE IF NOT EXISTS category (
    id TEXT PRIMARY KEY,
    name TEXT          NOT NULL,
    icon_name TEXT,
    icon_color TEXT,
    category_type TEXT NOT NULL,
    parent_id TEXT,
    updated_at TEXT,
    sync_status TEXT    NOT NULL DEFAULT 'synced',
    last_synced_at TEXT,
    modified_locally_at TEXT
);

CREATE TABLE IF NOT EXISTS booking (
    id TEXT PRIMARY KEY,
    date TEXT        NOT NULL,
    description TEXT,
    amount REAL      NOT NULL DEFAULT 0,
    category_id TEXT NOT NULL,
    account_id TEXT  NOT NULL,
    updated_at TEXT,
    sync_status TEXT    NOT NULL DEFAULT 'synced',
    last_synced_at TEXT,
    modified_locally_at TEXT
);
