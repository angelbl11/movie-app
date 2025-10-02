# 🎬 Movie App

Una aplicación móvil construida con Flutter para descubrir, buscar y guardar tus películas favoritas. La app consume datos de una API de películas para mostrar información relevante y actualizada.

---

## ✨ Features

- **Descubre:** Visualiza una lista de las películas más populares del momento.
- **Busca:** Encuentra películas por su título.
- **Detalles:** Obtén información detallada de cada película, incluyendo sinopsis, calificación y fecha de estreno.
- **Favoritos:** Guarda y gestiona una lista local de tus películas preferidas.

---

## 📋 Requisitos

- Flutter SDK 3.8.0 o superior
- Dart 3.0 o superior

---

## 🛠️ Configuración y Setup

Para configurar el proyecto en tu entorno local, sigue estos pasos:

1.  **Clona el repositorio:**

    ```bash
    git clone [https://github.com/angelbl11/movie-app](https://github.com/angelbl11/movie-app)
    cd movie-app
    ```

2.  **Configura las variables de entorno:**
    Esta aplicación utiliza `--dart-define` para manejar las claves de API y las URLs base. Para ejecutar la app, debes proporcionar estas variables.

    - **API_URL**: La URL base del endpoint de la API.
    - **API_KEY**: Tu token de autorización (Bearer Token) para la API.

3.  **Instala las dependencias:**

    ```bash
    flutter pub get
    ```

4.  **Ejecuta el generador de código:**
    El proyecto utiliza `build_runner` para generar el código necesario para `json_serializable`, `riverpod_generator` y `mockito`. Ejecuta el siguiente comando para generar los archivos `.g.dart` y `.mocks.dart`.
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

---

## ▶️ Ejecutar la App

Ejecuta la aplicación pasando las variables de entorno que configuraste en el paso 2.

```bash
flutter run --dart-define=API_URL="[https://api.themoviedb.org/3/](https://api.themoviedb.org/3/)" --dart-define=API_KEY="TU_BEARER_TOKEN_AQUI"
```

---

## 🏛️ Arquitectura y Decisiones Técnicas

El proyecto sigue una arquitectura por capas para separar responsabilidades y facilitar el mantenimiento y la escalabilidad.

### Estructura de Carpetas

La estructura del proyecto está organizada por funcionalidad y tipo de capa:

```
lib/
├── core/             # Lógica compartida (tema, widgets, constantes)
├── data/             # Modelos de datos (Movie, MovieDetail, etc.) y lógica de serialización
├── presentation/     # Capa de UI, organizada por pantalla (home, details, favorites)
│   ├── home/
│   └── ...
├── providers/            # Todos los providers de Riverpod (Shared preferences para las peliculas favoritas)
└── repositories/         # Lógica de acceso a datos (API)
test/
├── unit/             # Pruebas unitarias para la lógica de servicios/providers
└── widget/           # Pruebas de widgets para los componentes de la UI
```

### Componentes Clave

- **Gestión de Estado:** **Riverpod** se utiliza como la solución principal para la inyección de dependencias y la gestión de estado. Se favorece el uso de `AsyncNotifier` para manejar los estados asíncronos (loading, data, error) de las llamadas a la API.

- **Networking:** **Dio** es el cliente HTTP utilizado para todas las comunicacione con la API externa. La lógica de las llamadas se encapsula en funciones dentro de la capa de `services` o `repositories`.

- **Modelado de Datos:** **`json_serializable`** se usa para automatizar la conversión de datos JSON desde la API a objetos Dart fuertemente tipados, reduciendo el código manual y los errores.

- **Pruebas (Testing):** El proyecto incluye tanto pruebas unitarias como de widgets. **Mockito** se utiliza para crear mocks de las dependencias (como el cliente `Dio`) y así poder probar la lógica de negocio de forma aislada.

---

## 🧪 Testing

### Ejecutar todos los tests

```bash
flutter test
```

### Tests por categoría

```bash
# Pruebas Unitarias y de Servicios (API, Lógica)
flutter test test/unit/

# Pruebas de Widgets (UI)
flutter test test/widget/
```
