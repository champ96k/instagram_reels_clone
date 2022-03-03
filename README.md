# App Architecture

<p align="center">
  <img src="https://bloclibrary.dev/assets/cubit_architecture_full.png" />
</p>

Using the bloc library allows us to separate our application into three layers:

- Presentation
- Business Logic
- Data
  - Repository
  - Data Provider

## Documentation

- [Install Flutter](https://flutter.dev/get-started/)
- [Flutter documentation](https://flutter.dev/docs)

## Requirements

- [Dart 2.12.0+ (stable channel)](https://github.com/dart-lang/sdk/wiki/Installing-beta-and-dev-releases-with-brew,-choco,-and-apt-get#installing)

- [Flutter <= 2.5.0 (stable channel)](https://docs.flutter.dev/development/tools/sdk/releases)

## Environment

<img height="520px" src="https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?w=556&ssl=1" align="right" />

**iOS**

- iOS 13+

**Android**

- Android 5.1+
  - minSdkVersion 22
- targetSdkVersion 30

## Explanation & Project Organization

Every _feature_ of the app, will be divided into 2 parts - `core` and `src` [more info](https://bloclibrary.dev/#/architecture).

## Dependency Injection

- In Flutter, the default way to provide object/services to widgets is through InheritedWidgets. If you want a widget or it’s model to have access to a service, the widget has to be a child of the inherited widget. This causes unnecessary nesting.
- That’s where [get it](https://pub.dev/packages/get_it) comes in. An IoC that allows you to register your class types and request it from anywhere you have access to the container..

_You don’t need to wrap any widgets to inherit anything, or need the context anywhere. All you do is import the service_locator file and use the locator to resolve your type. This means that in places without the context you’ll still be able to inject the correct services and values, even if the app’s UI structure changes._

## Code Style

- [Effective Dart](https://dart.dev/guides/language/effective-dart)

## Models

**If added some models for api results**

- Use [Freezed](https://pub.dev/packages/freezed)

## Code collections

#### Architecture

| Working status | Category         | Description                                                       | Codes                                                                                                                                                                                                                                                                                                                                         |
| :------------: | ---------------- | ----------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|       ✅       | Networking       | Using [dio](https://pub.dev/packages/dio)                         | [dio_http_service.dart](https://github.com/champ96k/wallpaper_hub/blob/develop/lib/core/services/dio_http_service.dart)                                                                                                                                                                                                                       |
|       ✅       | Data             | Using [Freezed](https://pub.dev/packages/freezed)                 | [model classes](https://github.com/champ96k/wallpaper_hub/blob/develop/lib/core/models/wallpaper_model.dart)                                                                                                                                                                                                                                  |
|       ✅       | Video Player | Using [video_player](https://pub.dev/packages/video_player)                       | [Video player](https://github.com/champ96k/instagram_reels_clone/blob/main/lib/screen/players/video_player_screen.dart)                                                                                                                                                                                                                                  |
|       ✅       | Constants        | Define constants                                  | [constants.dart](https://github.com/champ96k/instagram_reels_clone/blob/main/lib/core/constants/constants.dart) |
|       ✅       | Error handling   | Handdle dio error `statusCode` and `message` and custom error | [custom_error.dart](https://github.com/champ96k/instagram_reels_clone/blob/main/lib/core/app_configs/custom_error.dart)                                |

## Getting Started

### Setup

```shell script
$ git branch -m main
$ git fetch origin main
$ git branch -u origin main
$ git remote set-head origin -a
```

### Run app

```shell script
$ flutter pub get
$ flutter packages pub run build_runner build --delete-conflicting-outputs
$ flutter run
```

### Demo Video

[![Watch the video](http://img.youtube.com/vi/3b-FcKnzhg4/hqdefault.jpg)](https://youtu.be/3b-FcKnzhg4)
