# budget-fusion-app

## Prerequisites

- Flutter: 3.29.3
- Dart:  3.7.2
- Java: openjdk 17.0.9
- Android SDK: 34
- Android Studio: 2024.3.2

## Useful commands

watch changes:

```
fvm flutter pub run build_runner watch --delete-conflicting-outputs
```

Preview all automated Dart code fixes (lint and migration suggestions)

```
fvm dart fix --dry-run
```

Apply Dart code fixes automatically

```
fvm dart fix --apply
```