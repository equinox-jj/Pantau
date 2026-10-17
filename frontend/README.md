# Pantau mobile app

Flutter app for reporting and tracking local civic infrastructure problems: potholes, broken streetlights, illegal dumping, clogged drains, damaged signage and sidewalks. A resident photographs the issue, pins its location, picks a category, and submits it. The report appears on a public map, and its status history is visible at every step.

The app talks to the Pantau API in [`../backend`](../backend/README.md).

## Features

**Citizens**

- **Map**: nearby reports as clustered markers on OpenStreetMap, with a status sheet, locate button, and full-screen place search.
- **Feed**: a photo-led list with two segments, *Nearby* (around your current position) and *My reports* (your own submissions, newest first).
- **New report**: one to four photos from the camera or gallery, a category, an optional description, and a location picked on a draggable pin with a reverse-geocoded address. Submitting asks for confirmation first.
- **Report detail**: photos, category, distance, current status, the full status timeline, sharing, and directions in the device's maps app. A rejected report shows the resolver's note and offers *Edit & resubmit*, which reopens the form with its category, description, and location filled in (photos must be added again).

**Resolvers**

- **Queue**: nearby reports split into *Open*, *In progress*, and *Resolved* tabs.
- **Map**: the same reports on a map with preview cards.
- **Status actions** on the report detail page: move a report to its next allowed status with an optional note (the API requires a note to reject).

**Everyone**

- Onboarding, registration, and login; the app routes citizens and resolvers to their own tab shells after sign-in.
- **Profile**: add, replace, or remove a profile picture; change password; help and feedback; sign out.

Report status follows the API's workflow: `reported → acknowledged → in_progress → resolved → closed`, and a resolver can move a report to `rejected` from any of the first three.

## Stack

- Flutter (`>=3.47.0`, Dart `^3.13.0`); Material widgets come from the `material_ui` package
- Riverpod 3 (`flutter_riverpod` + `riverpod_generator`) for state and dependency injection
- `go_router` for navigation, with a `StatefulShellRoute` per role
- `dio` for networking; `flutter_secure_storage` for the access token and `shared_preferences` for cached profile and onboarding state
- `flutter_map`, `flutter_map_marker_cluster`, `latlong2`, and `geolocator` for maps and location
- `image_picker` and `permission_handler` for photos and permissions
- `freezed` and `json_serializable` for models, `fpdart` (`Either<Failure, T>`) for error handling
- `skeletonizer`, `google_fonts`, `share_plus`, and `url_launcher` for UI polish, sharing, and opening the maps app
- `mocktail` for test doubles

## Architecture

Feature-first, Clean Architecture per feature:

```
lib/
  core/               shared code: base classes, components, DI, error, local_storage,
                      network, router, service, theme, utils
  features/
    <feature>/
      data/
        datasources/  abstract data source + its *_impl.dart
        mapper/       model ↔ entity
        model/        freezed / json_serializable wire models
        repository/   repository implementations
      di/             Riverpod providers wiring data sources, repositories, and use cases
      domain/
        entity/       freezed domain types
        repository/   repository contracts
        usecase/      one operation each, returning Future<Either<Failure, T>>
      presentation/
        pages/<page>/
          provider/   generated notifiers holding page state
          listener/   side effects (snackbars, navigation) driven by notifier state
          widgets/
```

Current features: `auth`, `dashboard`, `map`, `onboarding`, `profile`, `report`, `resolver`. The `map` feature also owns report creation, the location picker, place search, and report detail.

`AuthInterceptor` adds `Authorization: Bearer <token>` to every request not flagged `noAuth`. On a 401 it clears the stored session and the router sends the user back to login.

### External services

Map tiles come from `tile.openstreetmap.org`. Place search and reverse geocoding use the public [Nominatim](https://nominatim.org) API, which requires a User-Agent and allows about one request per second; search therefore runs on submit rather than on every keystroke, and the location picker debounces and caches pin lookups. These requests never carry the Pantau token.

## Getting started

1. Start the API; see the [backend guide](../backend/README.md#run-locally).
2. Install dependencies, generate code, and run:

   ```sh
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   flutter run
   ```

The API base URL is set in [`lib/core/network/api_endpoints.dart`](lib/core/network/api_endpoints.dart): `http://10.0.2.2:8080/api/v1` on an Android emulator and `http://127.0.0.1:8080/api/v1` everywhere else. For a physical device, change it to an address the device can reach (or use `adb reverse tcp:8080 tcp:8080` on Android). Photos load from the backend's `MINIO_PUBLIC_URL`, which must be reachable from the device too.

### Code generation

Riverpod providers, freezed classes, and JSON serializers are generated. Rerun the generator after changing any annotated class:

```sh
./script/build_runner.sh          # same as the build_runner command above
dart run build_runner watch --delete-conflicting-outputs
```

### Scaffolding a feature

New features scaffold from the Mason brick in `bricks/features` (registered as `feature` in `mason.yaml`). With [`mason_cli`](https://pub.dev/packages/mason_cli) installed:

```sh
mason get
./script/gen_module.sh            # mason make feature -o lib/features
```

## Testing

```sh
flutter test
```

Unit tests live under `test/`, mirroring `lib/core` and `lib/features`. They cover data sources, mappers, repositories, use cases, and notifiers.
