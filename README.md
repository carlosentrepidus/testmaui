# MAUITest – Prueba Técnica

Este repositorio es una **plantilla** para la prueba técnica. Contiene dos proyectos base:

- **`mauitest-api/`**: proyecto .NET con API y base de datos PostgreSQL (Docker), incluye datos precargados y endpoints base.
- **`mauitest-maui/`**: proyecto .NET MAUI con la estructura inicial de la app móvil que consumirá la API.

---

## 🚀 Instrucciones para iniciar la prueba

1. **Crea tu repositorio privado desde esta plantilla**
   - Pulsa el botón **“Use this template”** arriba a la derecha.
   - Crea un repositorio **PRIVADO** en tu cuenta de GitHub.
   - Añade como colaborador a: `<TU_USUARIO_GITHUB>`.

2. **Crea una rama de trabajo**
   ```bash
   git checkout -b feature/<tu-nombre>
   ```

3. **Implementa tu solución** sobre esa rama.

4. **Entrega**
   - Crea un **Pull Request** de tu rama a `main`.
   - Comparte el enlace al PR.

⏱ **Tiempo máximo**: 48 horas desde que recibes estas instrucciones.

---

## 📂 Estructura del repositorio

```
MAUITest/
│
├── mauitest-api/        # API en .NET + Docker + PostgreSQL
│   ├── db/init.sql      # Script de creación y datos semilla
│   ├── Models/          # Entidades base
│   ├── appsettings.json # Configuración de la API
│   ├── Dockerfile       # Imagen de la API
│   └── docker-compose.yml
│
├── mauitest-maui/       # Proyecto .NET MAUI (aplicación móvil)
│   ├── Platforms/       # Configuración por plataforma (iOS, Android, etc.)
│   ├── Resources/       # Estilos, imágenes, fuentes
│   ├── App.xaml         # Punto de entrada visual
│   └── MainPage.xaml    # Pantalla inicial
│
└── .gitignore
```

### 🔹 `mauitest-api`
- Proporciona un backend con PostgreSQL y un API básico.
- Al levantarlo con Docker, se crea la BD con datos precargados (usuarios, géneros, canciones).
- Tu tarea será **mapear modelos, crear endpoints y consultas necesarias** para soportar la app móvil.

### 🔹 `mauitest-maui`
- Estructura mínima de una aplicación MAUI.
- Debe **consumir el API** para implementar la funcionalidad requerida.

---

## 🎯 Requerimiento principal

Con estos proyectos deberás implementar una aplicación MAUI que permita la **creación de playlists por usuario**.

### Páginas requeridas:
1. **Login**:  
   - Usar los usuarios precargados en la base de datos.
   - Autenticación básica (no se requiere OAuth/Identity completo).

2. **Listado de playlists**:  
   - Mostrar las playlists del usuario autenticado.

3. **Creación / Edición de playlist**:  
   - Seleccionar un género.
   - Mostrar canciones de ese género.
   - Permitir seleccionar múltiples canciones de varios géneros.
   - Guardar la playlist.

4. **Visualización detallada de playlist**:  
   - Mostrar la lista de canciones seleccionadas en la playlist.

---

## ✅ Criterios de evaluación

- **Funcionalidad (40%)**: cumple los requisitos.
- **Calidad del código (25%)**: organización, buenas prácticas, legibilidad.
- **Uso de la API (15%)**: endpoints bien definidos y consumidos desde MAUI.
- **Diseño/UI (10%)**: navegación clara, experiencia mínima de usuario.
- **README y claridad (10%)**: pasos para ejecutar tu solución.

---

¡Éxitos con la prueba 🚀!
