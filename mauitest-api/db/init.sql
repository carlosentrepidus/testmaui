
-- init.sql - Playlists schema seed for PostgreSQL
-- Tables: genres, songs, users, playlists, playlist_songs
-- Seeds: 20 genres, 1000 songs, 3 users, 3 sample playlists with songs

-- ===== Schema =====

CREATE TABLE IF NOT EXISTS genres (
  id   SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS songs (
  id         SERIAL PRIMARY KEY,
  title      TEXT NOT NULL,
  artist     TEXT NOT NULL,
  image_url  TEXT,
  genre_id   INTEGER NOT NULL REFERENCES genres(id) ON DELETE RESTRICT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS users (
  id        SERIAL PRIMARY KEY,
  username  TEXT NOT NULL UNIQUE,
  password  TEXT NOT NULL -- hash opcional; para prueba puede ser texto plano
);

CREATE TABLE IF NOT EXISTS playlists (
  id         SERIAL PRIMARY KEY,
  name       TEXT NOT NULL,
  user_id    INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS playlist_songs (
  playlist_id INTEGER NOT NULL REFERENCES playlists(id) ON DELETE CASCADE,
  song_id     INTEGER NOT NULL REFERENCES songs(id) ON DELETE RESTRICT,
  PRIMARY KEY (playlist_id, song_id)
);


-- ===== Indexes =====
CREATE INDEX IF NOT EXISTS ix_songs_genre_id       ON songs(genre_id);
CREATE INDEX IF NOT EXISTS ix_songs_title          ON songs(title);
CREATE INDEX IF NOT EXISTS ix_playlists_user_id    ON playlists(user_id);
CREATE INDEX IF NOT EXISTS ix_playlist_songs_song  ON playlist_songs(song_id);

-- ===== Seed (idempotent) =====
-- Truncation order respects FK dependencies.
TRUNCATE TABLE
  playlist_songs,
  playlists,
  users,
  songs,
  genres
RESTART IDENTITY
CASCADE;


-- 20 musical genres
INSERT INTO genres(name) VALUES
('Pop'),
('Rock'),
('Hip-Hop'),
('R&B'),
('Electronic'),
('House'),
('Techno'),
('Trance'),
('Drum & Bass'),
('Reggaeton'),
('Salsa'),
('Bachata'),
('Merengue'),
('Jazz'),
('Blues'),
('Country'),
('Folk'),
('Classical'),
('Metal'),
('K-Pop');

-- 1000 songs (deterministic names, artists, images, round-robin genres 1..20)
WITH nums AS (
  SELECT generate_series(1, 1000) AS n
),
adjs AS (
  SELECT ARRAY[
    'Midnight','Golden','Electric','Lonely','Wild','Silent','Neon','Crystal','Velvet','Fading',
    'Cosmic','Burning','Silver','Broken','Hidden','Shining','Frozen','Secret','Endless','Furious'
  ] AS a
),
nouns AS (
  SELECT ARRAY[
    'Dreams','Hearts','Skies','Echoes','Roads','Lights','Shadows','Waves','Fire','Voices',
    'Horizons','Storms','Whispers','Trains','Memories','Rivers','Giants','Lines','Stories','Reflections'
  ] AS a
),
firsts AS (
  SELECT ARRAY[
    'Luna','Kai','Ava','Milo','Noa','Iris','Leo','Zoe','Nico','Maya',
    'Hugo','Lia','Alex','Nina','Ezra','Vera','Omar','Vio','Eli','Gala'
  ] AS a
),
lasts AS (
  SELECT ARRAY[
    'Rivera','Stone','Nova','Vega','Blake','Cruz','Reed','Hart','Skye','Hayes',
    'Knight','Quinn','Lane','Rhodes','King','Brooks','Cole','Fox','Young','Grey'
  ] AS a
)
INSERT INTO songs(title, artist, image_url, genre_id)
SELECT
  (adjs.a[(n % 20) + 1] || ' ' || nouns.a[((n / 2) % 20) + 1] || ' ' || n)::text AS title,
  (firsts.a[((n + 7) % 20) + 1] || ' ' || lasts.a[((n + 13) % 20) + 1])::text      AS artist,
  ('https://picsum.photos/seed/' || n || '/400/400')::text                        AS image_url,
  ((n - 1) % 20) + 1                                                               AS genre_id
FROM nums, adjs, nouns, firsts, lasts;

-- Users (demo)
INSERT INTO users(username, password) VALUES
('user1','1234'),
('user2','1234'),
('user3','1234');
-- Done.
