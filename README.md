# 🎬 Movie App

A mobile application built with Flutter to discover, search, and save your favorite movies. The app consumes data from a movie API to display relevant and up-to-date information.

---

## ✨ Features

- **Discover:** View a list of the most popular movies currently trending.
- **Search:** Find movies by their title.
- **Details:** Get detailed information for each movie, including a synopsis, rating, and release date.
- **Favorites:** Save and manage a local list of your favorite movies.

---

## 📋 Requirements

- Flutter SDK 3.8.0 or higher
- Dart 3.0 or higher

---

## 🛠️ Configuration and Setup

To set up the project in your local environment, follow these steps:

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/angelbl11/movie-app
    cd movie-app
    ```

2.  **Set up environment variables:**
    This application uses `--dart-define` to handle API keys and base URLs. To run the app, you must provide these variables.

    - **API_URL**: The base URL for the API endpoint.
    - **API_KEY**: Your authorization token (Bearer Token) for the API.

3.  **Install dependencies:**

    ```bash
    flutter pub get
    ```

4.  **Run the code generator:**
    The project uses `build_runner` to generate the necessary code for `json_serializable`, `riverpod_generator`, and `mockito`. Run the following command to generate the `.g.dart` and `.mocks.dart` files.

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

---

## ▶️ Running the App

Run the application by passing the environment variables you configured in step 2.

```bash
flutter run --dart-define=API_URL="https://api.themoviedb.org/3/" --dart-define=API_KEY="YOUR_BEARER_TOKEN_HERE"
```

Alternatively, using the environments from the repository and the included `makefile`, run:

```bash
make run
```

---

## 🏛️ Architecture and Technical Decisions

The project follows a layered architecture to separate responsibilities and facilitate maintenance and scalability.

### Folder Structure

The project structure is organized by feature and layer type:

```
lib/
├── core/             # Shared logic (theme, widgets, constants)
├── data/             # Data models (Movie, MovieDetail, etc.) and serialization logic
├── presentation/     # UI Layer, organized by screen (home, details, favorites)
│   ├── home/
│   └── ...
├── providers/        # All Riverpod providers (SharedPreferences for favorite movies)
└── repositories/     # Data access logic (API)
test/
├── unit/             # Unit tests for service/provider logic
└── widget/           # Widget tests for UI components
```

### Key Components

- **State Management:** **Riverpod** is used as the primary solution for dependency injection and state management. The `AsyncNotifier` pattern is favored for handling asynchronous states (loading, data, error) from API calls.

- **Networking:** **Dio** is the HTTP client used for all communication with the external API. The logic for these calls is encapsulated in functions within the `repositories` layer.

- **Data Modeling:** **`json_serializable`** is used to automate the conversion of JSON data from the API into strongly-typed Dart objects, reducing boilerplate and potential errors.

- **Testing:** The project includes both unit and widget tests. **Mockito** is used to create mocks for dependencies (like the `Dio` client) to test business logic in isolation.

---

## 🧪 Testing

### Run all tests

```bash
flutter test
```

### Tests by category

```bash
# Unit and Service Tests (API, Logic)
flutter test test/unit/

# Widget Tests (UI)
flutter test test/widget/
```
