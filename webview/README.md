# webview

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Screenshot

![Screenshot](./Screenshot.png)

## Installing

- [webview_flutter](https://pub.dev/packages/webview_flutter)  
  A Flutter plugin that provides a WebView widget on Android and iOS.

  ```shell
  fvm flutter pub add webview_flutter
  ```

  Import it

  ```dart
  import 'package:webview_flutter/webview_flutter.dart';
  ```

## Configure

Edit `android/app/src/main/AndroidMainfest.xml`

```xml
<manifest ... >
    <uses-permission android:name="android.permission.INTERNET"/>
    <application>
        ...
    </application>
</manifest>
```

Edit `android/app/src/main/AndroidMainfest.xml` to allow http.

```xml
<manifest ... >
    <application ...
        android:usesCleartextTraffic="true">
        ...
    </application>
</manifest>
```

Edit `android/app/build.gradle`

```txt
android {
    defaultConfig {
        minSdkVersion 19
    }
}
```

Edit `ios/Runner/Info.plist` to allow http.

```xml
<dict>
    ...
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsLocalNetworking</key>
        <true/>
        <key>NSAllowsArbitraryLoadsInWebContent</key>
        <true/>
    </dict>
</dict>
```