# template_project

A template Flutter project for reusable project.

## Getting Started

This project is a starting point for a Flutter application.

Folder stucture consist of:
- [aplication](./lib/application) for your Business Logic(BLoC)
- [domain](./lib/domain) for failure object, value object, definition object and interfaces for facade/repository
- [infrastucture](./lib/infrastructure) for implementation of facade/repository, data model, API response object
- [presentation](./lib/presentation) for your UI layout and Widget 

Please put your reusable code on each folder structure in core folder

for running builder run this command

flutter packages run build_runner build --delete-conflicting-outputs

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
