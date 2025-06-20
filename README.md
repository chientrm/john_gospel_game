# John Gospel Game

John Gospel Game is a sample command-line application inspired by the Gospel of John. It features an interactive experience with a focus on text rendering and SDL utilities.

## Features

- Command-line gameplay
- Modular library code in `lib/`
- SDL-based text rendering (via native bindings)

## Getting Started

### Prerequisites

- Dart SDK (https://dart.dev/get-dart)
- SDL2 library (for native bindings)

### Installation

1. Clone the repository:
   ```bash
   git clone <repo-url>
   cd john_gospel_game
   ```
2. Get Dart dependencies:
   ```bash
   dart pub get
   ```
3. (Optional) Build native code:
   ```bash
   cd native
   make
   cd ..
   ```

### Running the Game

Run the main entrypoint:

```bash
dart run bin/john_gospel_game.dart
```

## Project Structure

- `bin/` - Entry point for the application
- `lib/` - Library and game logic
- `native/` - Native C code and bindings
- `assets/` - Fonts and other assets

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](LICENSE)
