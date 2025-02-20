# code_base

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on
mobile development, and a full API reference.

## Versions

| Name        | Version |
| ----------- |---------|
| Flutter SDK | v3.13.6 |

## Commands:

- Generate translations: fvm flutter pub run easy_localization:generate -S assets/translations -f keys -O lib/core/translations -o locale_keys.g.dart
- Freezed: fvm flutter pub run build_runner build --delete-conflicting-outputs
- Generate icon app: fvm flutter pub run flutter_launcher_icons

## Build and deploy

- DEV: (optional: fvm) flutter build apk --flavor dev -t lib/main_dev.dart
- STG: (optional: fvm) flutter build apk --flavor stg -t lib/main_stg.dart
- PRD: (optional: fvm) flutter build apk --flavor prd -t lib/main_prd.dart
- WEB: (optional: fvm) flutter build web --target='lib/main_xxx.dart' --release --web-renderer canvaskit


