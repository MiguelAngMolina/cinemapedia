# 🎬 Cinemapedia - Flutter App

Aplicación desarrollada en **Flutter** que consume la API pública de **The Movie Database (TMDB)** para mostrar información detallada de películas, incluyendo su reparto, videos, estrenos, populares y más.  
Además, la app permite **guardar películas como favoritas** utilizando una base de datos local.

---

## 🚀 Tecnologías principales

- 🧩 **Flutter** — Framework multiplataforma para desarrollo móvil.  
- 🌐 **The Movie Database (TMDB) API** — Fuente de datos para películas y actores.  
- ⚙️ **Dio** — Cliente HTTP utilizado para el consumo de la API.  
- 💾 **Local Database** — Para almacenar películas favoritas en el dispositivo (Isar).  
- 🧠 **State Management:** Riverpod.  

---

## 🧩 Requisitos previos

Asegúrate de tener instalado:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=3.0.0`
- [Dart](https://dart.dev/get-dart)
- Emulador o dispositivo físico configurado
- Una cuenta y **API Key** válida de [The Movie Database](https://www.themoviedb.org/documentation/api)

---

## ⚙️ Configuración del entorno

1. **Clonar el repositorio**

   ```bash
   git clone https://github.com/MiguelAngMolina/cinemapedia.git
   cd cinemapedia
   ```
2. **Configurar las variables de entorno**

   Copia el archivo ```.env.template```, renómbralo a ```.env``` y reemplaza las variables según tu configuración:

   ```env
   THE_MOVIEDB_KEY =tu_api_key_de_themoviedb
   ```
3. **Ejecutar la app**
   ```bash
   flutter run
   ```
---
## 🎞️ Funcionalidades principales

- 🔹 **Cartelera actual:** muestra las películas en estreno (`now_playing`).
- 🔹 **Populares, mejor valoradas y próximas:** carga datos paginados (`popular`, `top_rated`, `upcoming`).
- 🔹 **Detalles de película:** descripción, géneros, duración, puntuación y trailer.
- 🔹 **Reparto:** lista de actores principales por película.
- 🔹 **Búsqueda:** encuentra películas por título o palabra clave.
- 🔹 **Similares:** muestra recomendaciones relacionadas con la película actual.
- 🔹 **Favoritos:** guarda películas en la base de datos local para verlas sin conexión.

---
## 📄 Licencia

Este proyecto usa la API de **The Movie Database (TMDB)**.  
TMDB y su logotipo son marcas registradas. El uso está sujeto a sus [términos de servicio](https://www.themoviedb.org/terms-of-use).

