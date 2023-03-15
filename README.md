# SpaceX rockets app using Bloc Pattern

SpaceX app clone flutter project using flutter_bloc package.

## Screenshots

<img alt="Home Screen" height="550" src="assets/screenshots/home-screen.png" width="250"/>  <img alt="Rocket Details Screen one" height="550" src="assets/screenshots/detail-screen-one.png" width="250"/> <img alt="Rocket Details Screen two" height="550" src="assets/screenshots/detail-screen-two.png" width="250"/>

## Folder structure

```bash
.
├── core
│   ├── constant
│   ├── data_sources
│   ├── enums
│   ├── exceptions
│   ├── managers
│   ├── navigation
│   ├── models
│   ├── repositories
│   ├── services
│   └── utils
└── ui
    ├── shared
    ├── views
    └── widgets
```

## Features

### Master branch

- [x] json serialization
- [x] connectivity service
- [x] http service
- [x] navigation service
- [x] key storage service
- [x] local storage service (NoSQL)
- [x] life cycle manager to start/stop background services
- [x] snack bar service

## Example pages included

- Home View (Renders a list of rockets fetched from JSON place holder API [r-spacex/SpaceX-API])
- Rocket Details View (Dynamic view that loads the rocket information)

## API Documentation

- [SpaceX api documentation](https://github.com/r-spacex/SpaceX-API/blob/master/docs/README.md)