# Simple Dialog Demo

A Flutter application demonstrating the implementation and usage of the SimpleDialog widget. This app showcases how to create interactive dialogs with multiple options in a clean, user-friendly interface.

## Features

- **Simple Dialog Implementation**: Demonstrates the basic usage of Flutter's SimpleDialog widget
- **Interactive UI**: Click a button to trigger the dialog
- **Multiple Options**: Dialog contains two selectable options
- **Clean Design**: Minimalist interface focusing on the dialog functionality
- **Responsive Layout**: Works across different screen sizes

## Screenshots

### Main Screen
![Main Screen](screenshot1.png)
*The main application screen with the "Show Dialog" button*

### Dialog Display
![Dialog Display](screenshot2.png)
*The SimpleDialog widget showing available options*

## Code Structure

The application consists of:

- **MyApp**: The root widget that sets up the MaterialApp
- **MyHomePage**: The main screen containing the trigger button
- **SimpleDialog**: The dialog widget with two options

### Key Components

```dart
SimpleDialog(
  title: const Text('Choose an option'),
  children: [
    SimpleDialogOption(
      onPressed: () => Navigator.pop(context),
      child: const Text('Option 1'),
    ),
    SimpleDialogOption(
      onPressed: () => Navigator.pop(context),
      child: const Text('Option 2'),
    ),
  ],
)
```

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- An IDE (Android Studio, VS Code, or similar)
- Android/iOS emulator or physical device

### Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/simple-dialog-demo.git
   cd simple-dialog-demo
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Alternative Run Methods

- **For web**: `flutter run -d chrome`
- **For specific device**: `flutter devices` then `flutter run -d [device-id]`
- **Release mode**: `flutter run --release`

## How to Use

1. Launch the application
2. Tap the "Show Dialog" button in the center of the screen
3. The SimpleDialog will appear with two options
4. Select either "Option 1" or "Option 2"
5. The dialog will close automatically after selection

## Technical Details

### Widget Hierarchy
```
MyApp
└── MyHomePage (Scaffold)
    ├── AppBar
    └── Body (Center)
        └── ElevatedButton
            └── showDialog()
                └── SimpleDialog
                    ├── Title
                    └── Children (SimpleDialogOptions)
```

### Dialog Properties
- **Title**: "Choose an option"
- **Options**: Two clickable options that dismiss the dialog
- **Behavior**: Modal dialog that requires user interaction

## Customization Options

You can easily customize this demo by:

- Adding more `SimpleDialogOption` widgets
- Changing the dialog title and option text
- Modifying the button styling
- Adding custom actions for each option
- Implementing different dialog types (AlertDialog, custom dialogs, etc.)

## Learning Objectives

This demo helps understand:
- How to implement SimpleDialog in Flutter
- Dialog navigation and context management
- Event handling in Flutter widgets
- Basic Flutter app structure and widget composition

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
```

## Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Desktop (Windows, macOS, Linux)

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request