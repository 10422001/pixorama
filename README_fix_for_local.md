# Pixorama

Pixorama is a multi-user pixel editor inspired by r/place. The app demonstrates
the real-time capabilities of Serverpod. It is a complete example and you can
try it out at [https://pixorama.live](https://pixorama.live).

For full Serverpod documentation, please visit
[https://docs.serverpod.dev](https://docs.serverpod.dev).

# 1. Install Dart,Flutter and Docker

You will need Flutter version 3.0 or later. https://flutter.dev/docs/get-started/install

Docker is used to manage Postgres and Redis. https://docs.docker.com/get-docker/

Get Serverpod:

```bash
serverpod version
dart pub global activate serverpod_cli
serverpod
serverpod version
```

(serverpod version => 'Serverpod version: 1.0.1')

## Enable Dart support for the module 'pixorama' (IntelliJ)

Open Settings, search 'Dart', enable Dart Support for the project 'pixorama'
(Tipp: Error(red underlined) will appear, since get pub was not run yet!)

# Problem: Original runs with

Fix:

```bash
cd pixorama_client
flutter pub get
```
```bash
cd pixorama_flutter
flutter pub get
```
```bash
cd pixorama_server
flutter pub get
```

## Error: The pubspec.yaml file is not correct for local use. 
Resolving dependencies...
Because pixorama_server depends on serverpod from path which doesn't exist (could not find package serverpod at "../vendor/serverpod/packages/serverpod"), version solving
failed.

## 


## Server code

On the server side there are three main files that makes Pixorama tick. Two
serializable objects, found in the [protocol](pixorama_server/lib/src/protocol)
directory and the
[PixoramaEndpoint](pixorama_server/lib/src/endpoints/pixorama_endpoint.dart)
class. Those files are great starting points for understanding how Pixorama
works.

## Client code

The main Pixorama client/Flutter code can be found in
[Pixorama widget](pixorama_flutter/lib/src/pixorama/pixorama.dart).

## Running the server

To run the server locally, you need to first install Serverpod. Check the
[docs on getting started](https://docs.serverpod.dev).

Next, you need to setup the Docker container and Serverpod & Pixorama database tables:

```bash
cd pixorama_server
docker-compose up --build --detach
docker-compose run postgres env PGPASSWORD="PASSWORD" psql -h postgres -U postgres -d pixorama < generated/tables-serverpod.pgsql
docker-compose run postgres env PGPASSWORD="PASSWORD" psql -h postgres -U postgres -d pixorama < generated/tables.pgsql
```

Finally you should be able to start the server by running:

```bash
dart bin/main.dart
```

In the Flutter app you will need to modify the `main.dart` file to connect to
the local server instead of the live app server.

## Hosting the Flutter app with Serverpod

This project demonstrates how to use Serverpod to host a Flutter app.
The [deployment-aws.yml](.github/workflows/deployment-aws.yml) file in Github workflows contains the code that will
build the web app in CI/CD. You will also need the [build_web](scripts/build_web) script and use the modifications in
the server's [server.dart](pixorama_server/lib/server.dart) file.
