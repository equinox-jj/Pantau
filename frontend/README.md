# Pantau

Mobile app for reporting and tracking local civic infrastructure problems — potholes, broken streetlights, overflowing trash, clogged drains, damaged signage. Resident photographs issue, app captures location, categorises and submits. Report shows on public map, status moves `reported → acknowledged → in_progress → resolved / rejected → closed` with visible history at each step.

## Stack

- Flutter, Riverpod (`flutter_riverpod` + `riverpod_generator`) for state, single-class notifiers per feature
- `go_router` for navigation
- `dio` for networking, `drift` for local DB, `flutter_secure_storage` for secure storage
- `flutter_map` + `latlong2` for map/geolocation
- `freezed` for models, `json_serializable` for (de)serialization, `fpdart` for functional error handling
- `mocktail` for test doubles

## Architecture

Feature-first, Clean Architecture per feature:

```
lib/
  core/           # shared: base, components, DI, error, local_storage, network, router, service, theme, utils
  features/
    <feature>/
      data/
      di/
      domain/
      presentation/
```

Current features: `auth`, `dashboard`, `map`, `onboarding`, `profile`, `report`, `resolver`.

New features scaffold via Mason (`bricks/features`, see `mason.yaml`).

## Getting Started

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Testing

```bash
flutter test
```

Unit tests live under `test/`, mirroring `lib/core` and `lib/features`.
