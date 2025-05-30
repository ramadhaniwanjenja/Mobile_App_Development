# Temperature Converter

## Purpose
This Flutter app converts temperatures between Fahrenheit and Celsius, displaying results to two decimal places. It maintains a history of conversions and ensures a consistent UI in both portrait and landscape orientations, meeting the requirements of Individual Assignment 1.

## Architecture
- **Main Entry Point**: `main.dart` initializes the app with `TemperatureConverterApp`, a stateless widget that sets up the `MaterialApp`.
- **Core Widget**: `TemperatureConverterPage` is a `StatefulWidget` that manages the app's state using `setState`, handling user input, conversion logic, and history updates.
- **Key Widgets**:
  - `DropdownButton`: Allows selection between "Fahrenheit to Celsius" and "Celsius to Fahrenheit".
  - `TextField`: Captures user input for temperature with numeric keyboard support.
  - `ElevatedButton`: Triggers the conversion logic.
  - `ListView.builder`: Displays the conversion history, limited to 3 entries.
  - `OrientationBuilder`: Ensures the UI adapts to portrait and landscape modes.
- **State Management**: Uses `setState` to update the UI dynamically after conversions.
- **Input Validation**: A `SnackBar` displays errors for invalid or empty inputs.

## Critical Components
- **Conversion Logic**: Implemented in `_convertTemperature` function, using formulas:
  - F to C: `(°F - 32) × 5/9`
  - C to F: `(°C × 9/5) + 32`
  - Results are rounded to 2 decimal places with `toStringAsFixed(2)`.
- **History Management**: Stores up to 3 recent conversions in a `List<String>`, displayed with `ListView.builder`.
- **UI Styling**: Uses `ThemeData` with teal colors, a `Card` for history, and Material Design principles for a polished look.

## Setup Instructions
1. Install Flutter: Follow [flutter.dev](https://flutter.dev/docs/get-started/install).
2. Clone the repository: `git clone <your-repo-url>`.
3. Navigate to the project: `cd temperature_converter`.
4. Install dependencies: `flutter pub get`.
5. Run the app: `flutter run` (on an emulator or physical device).

## Notes
- Built using Flutter and Dart, tested on a Samsung SM-J730F (Android 9.0).
- Ensure virtualization is enabled in BIOS for emulator use (Intel VT-x).