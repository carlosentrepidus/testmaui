
# Playlists API + PostgreSQL (Docker)

Este backend usa **PostgreSQL** con tablas para *géneros*, *canciones*, *usuarios* y *playlists*.
Incluye un script `init.sql` que crea el esquema y precarga **20 géneros**, **1000 canciones** y **3 usuarios**, más **3 playlists de ejemplo**.

## Requisitos
- Docker Desktop / Engine activo
- .NET SDK 8 (o 9 si tu proyecto apunta a `net9.0`)
- (Opcional) curl o Postman para probar

## Archivos clave
```
/docker-compose.yml          # Orquestación (Postgres + API)
/db/init.sql                 # Esquema y semillas (coloca aquí este script)
/Dockerfile                  # Imagen para la API .NET
```
> Si ya tienes un `docker-compose.yml`, asegúrate de que monta `./db/init.sql` en `/docker-entrypoint-initdb.d/01-init.sql` del contenedor de Postgres.

## Levantar todo
```bash
docker compose up --build
```
- La primera vez creará el volumen de datos y ejecutará `db/init.sql` automáticamente.
- La API expondrá HTTP en `http://localhost:8080` (ajusta si usas otro puerto).

## Reinicializar la base (volver a cargar semillas)
```bash
docker compose down -v   # borra contenedores y volumen
docker compose up --build
```

## Esquema
- **genres(id, name)**
- **songs(id, title, artist, image_url, genre_id, created_at)**
- **users(id, username, password)**
- **playlists(id, name, user_id, created_at)**
- **playlist_songs(playlist_id, song_id)**  ← clave primaria compuesta

Relaciones:
- `songs.genre_id` → `genres.id` (RESTRICT)
- `playlists.user_id` → `users.id` (CASCADE on delete)
- `playlist_songs.playlist_id` → `playlists.id` (CASCADE on delete)
- `playlist_songs.song_id` → `songs.id` (RESTRICT on delete)

## Datos precargados
- 20 géneros (Pop, Rock, Hip-Hop, …, K-Pop)
- 1000 canciones con títulos/artistas determinísticos e imágenes de `picsum.photos`
- Usuarios demo: `user1/1234`, `user2/1234`, `user3/1234`
- Playlists demo:
  - `Starter Mix` (user1) → songs 1..10
  - `Focus Vibes` (user2) → songs 101..110
  - `Party Hits` (user3) → songs 501..510

## Notas para EF Core / Nombres en Postgres
- Tablas y columnas están en **minúsculas** (sin comillas) para evitar problemas.
- En tus entidades, puedes mapear con *data annotations* si lo necesitas:
  ```csharp
  [Table("songs")]
  public class Song {
      [Column("id")] public int Id { get; set; }
      [Column("title")] public string Title { get; set; } = "";
      [Column("genre_id")] public int GenreId { get; set; }
  }
  ```

¡Listo para usar!
