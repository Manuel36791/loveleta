# Loveleta

This project is powered by Flutter **3.19.4** and Dart **3.3.2**.

To select and install a specific version of flutter, we recommend using FVM: [fvm.app](https://fvm.app)

Bloc ([flutter_bloc](https://pub.dev/packages/flutter_bloc)) is used as an approach to state management, more precisely Cubit over Bloc from the same package. Bloc/Cubit handles `Events` and changes `States`. Screens and Widgtes subscribe to Bloc changes and send events (for Cubit, this is a direct method call).

The main packages used in the project:

```yaml
shared_preferences: "^2.2.2"
hive: "^2.2.3"  
hive_flutter: "^1.1.0"
bloc: "^8.1.2"  
flutter_bloc: "^8.1.3"  
freezed_annotation: "^2.4.1"
get_it: "^7.6.7" 
flutter_localizations:  
  sdk: flutter  
intl: "^0.18.0" 
permission_handler: "^11.2.0"  
connectivity_plus: "^5.0.2"   
equatable: "^2.0.5"  
dartz: "^0.10.1"   
dio: "^5.4.0"  
pretty_dio_logger: "^1.3.1"
logger: "^2.1.0"
flutter_screenutil: "^5.9.0" 
rxdart: "^0.27.7"
gap: "^3.0.1"
cached_network_image: "^3.3.1" 
pinput: "^3.0.1"
conditional_builder_null_safety: "^0.0.6"
flutter_native_splash: "^2.3.0" 
flutter_launcher_icons: "^0.13.1"
flutter_svg: "^2.0.9"
firebase_core: "^2.24.2"
firebase_messaging: "^14.7.10"
```


### Table of Contents

1. [How to build & run](#build&run)

2. [Localization](#localization)

3. [Project structure](#structure)


## How to build & run <a name="build&run"></a>

The minimum set of commands required to run project

```bash
-  flutter  pub  get  # to get dependencies
-  flutter  pub  run  intl_utils:generate  # to generate l10n.dart file from .arb localization files
-  flutter  pub  run  build_runner  build  --delete-conflicting-outputs  # to generate Freezed models
```

To build and run the project, you can use `Android Studio` or `Visual Studio Code` with Flutter/Dart plugins (`Flutter Intl`, `Dart`, `Flutter`), then the commands above will be executed automatically when building and running.

To build from console:

```bash
flutter  build  ios  --release 
# or
flutter  build  android  --release
```

``lib/main.dart`` - this is the main launch point of the project

## Localization <a name="localization"></a>

Localization in the application works through the Intl library ([pub.dev:intl](https://pub.dev/packages/intl))

After changing the arb files (`lib/l10n/intl_ar.arb` and `lib/l10n/intl_en.arb`), you need to regenerate the `l10n.dart` file using the `Flutter Intl` plugin or using this command:

```bash
flutter  pub  run  intl_utils:generate
```

After that, it becomes possible to use localization strings through class `S`:

```dart
S.of(context).key
# or
S.current.key
```

But this approach has limitations on the name of the localization keys. For example, keys must start with a letter, cannot contain spaces, or contain special characters.


## Project structure <a name="structure"></a>

Here is the folder structure we have been using in this project

```
lib/
|- core/
    |- database/
	|- dependency_injection/
	|- helpers/
	|- resources/
	|- router/
	|- service/
	|- shared/
		|- cubits/
		|- models/
		|- widgets/
	|- utils/
|- features/
|- firebase_options.dart
|- main.dart
|- main_view.dart
```