# dart-flutter-examples

A collection of Flutter examples.

## Table of Contents
- [dart-flutter-examples](#dart-flutter-examples)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
    - [Flutter SDK](#flutter-sdk)
    - [Flutter Version Manager](#flutter-version-manager)
    - [Install Android Studio](#install-android-studio)
    - [Install Visual Studio](#install-visual-studio)
  - [Deployment](#deployment)
  - [Commands](#commands)
  - [Widget Examples](#widget-examples)
  - [Recommended Packages](#recommended-packages)

## Installation

### Flutter SDK

Install Flutter SDK globally using the official installation guide.

<https://docs.flutter.dev/get-started/install/windows>

Edit environment variables for your account.

```txt
C:\Program Files\flutter\bin
```

### Flutter Version Manager

<https://fvm.app/docs/getting_started/installation/>

Run as administrator in `powershell`

```shell
dart pub global activate fvm
```

Edit environment variables for your account.

```txt
C:\Users\<USERNAME>\AppData\Local\Pub\Cache\bin
```

```shell
fvm releases
```

```shell
fvm install 3.7.12
```

```shell
fvm global 3.7.12
```

Edit environment variables for your account.

```txt
C:\Users\<USERNAME>\fvm\default\bin
```

```shell
fvm list
```

```shell
fvm use 3.7.12
```

Automatic Switching (Recommended)

Edit `.vscode/settings.json`:

```json
{
  "dart.flutterSdkPath": ".fvm/flutter_sdk",
  // Remove .fvm files from search
  "search.exclude": {
    "**/.fvm": true
  },
  // Remove from file watching
  "files.watcherExclude": {
    "**/.fvm": true
  }
}
```

### Install Android Studio

Download at <https://developer.android.com/studio>.

More Actions > SDK Manager > SDK Tools

- Android SDK Command-line Tools (latest)
- Google USB Driver
- Intel x86 Emulator Accelerator (HAXM installer)

```shell
flutter doctor --android-licenses
flutter doctor
```

### Install Visual Studio

Download at <https://visualstudio.microsoft.com/downloads/>.

Visual Studio > tool > Get tools and features > Desktop development with C++

```txt
[!] Visual Studio - develop Windows apps (Visual Studio Community 2022 17.5.5)
    X Visual Studio is missing necessary components. Please re-run the Visual Studio installer for the "Desktop development with C++" workload, and include these components:
        MSVC v142 - VS 2019 C++ x64/x86 build tools
         - If there are multiple build tool versions available, install the latest
        C++ CMake tools for Windows
        Windows 10 SDK
```

If you only want to develop mobile apps using Flutter, you can run:

```shell
flutter config --no-enable-windows-desktop
```

```shell
flutter doctor
```

## Deployment

Edit `android/app/src/main/AndroidMainfest.xml`

```xml
<manifest ... >
    <application ...
        android:label="APPLICATION_NAME">
        ...
    </application>
</manifest>
```

Edit `ios/Runner/Info.plist` to allow http.

```xml
<dict>
    ...
    <key>CFBundleDisplayName</key>
    <string>APPLICATION_NAME</string>
    ...
</dict>
```

Web app: `build/web`

```shell
fvm flutter build web --release
```

Windows app: `build/windows/runner/Release`

```shell
fvm flutter build windows --release
```

Android app: `build/app/outputs/flutter-apk/app-release.apk`

```shell
fvm flutter build apk --release --target-platform=android-arm64
```

Ios app: `build/ios/iphoneos`

```shell
fvm flutter build ios --release
```

## Commands

```shell
fvm flutter create --org com.example APPLICATION_NAME
```

```shell
cd APPLICATION_NAME
```

```shell
fvm flutter pub get
```

```shell
fvm flutter run
fvm flutter run -d chrome
fvm flutter run -d windows
```

```shell
fvm flutter pub outdated
fvm flutter pub upgrade
```

```shell
fvm flutter clean
```

## Widget Examples

StatelessWidget

```dart
import 'package:flutter/material.dart';

class ExampleStatelessWidget extends StatelessWidget {
  const ExampleStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Text')),
    );
  }
}
```

StatefulWidget

```dart
import 'package:flutter/material.dart';

class ExampleStatefulWidget extends StatefulWidget {
  const ExampleStatefulWidget({Key? key}) : super(key: key);

  @override
  State<ExampleStatefulWidget> createState() => _ExampleStatefulWidgetState();
}

class _ExampleStatefulWidgetState extends State<ExampleStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Text')),
    );
  }
}
```

## Recommended Packages

- [PERMISSION_HANDLER](PERMISSION_HANDLER.md)
- [LAUNCHER_ICONS](LAUNCHER_ICONS.md)
