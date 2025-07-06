# Flutter Notes App

A simple and clean note-taking app built with Flutter and Firebase. Users can create accounts, sign in, and manage their personal notes with full CRUD functionality.

## Features

- 🔐 **User Authentication** - Sign up and sign in with email/password
- 📝 **Create Notes** - Add new notes with a simple dialog
- ✏️ **Edit Notes** - Update existing notes
- 🗑️ **Delete Notes** - Remove notes with confirmation dialog
- 📱 **Responsive UI** - Clean, modern interface with Material Design
- ☁️ **Cloud Sync** - Notes are stored in Firebase Firestore
- 🔄 **Real-time Updates** - Changes sync automatically

## Screenshots

*Add your app screenshots here*

## Getting Started

### Prerequisites

- Flutter SDK
- Firebase project setup
- Android Studio or VS Code

### Installation

1. **Clone the repository**
```bash
git clone <your-repo-url>
cd notes_app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Setup Firebase**
   - Create a new Firebase project
   - Add Android/iOS app to your project
   - Download and add configuration files:
     - `google-services.json` → `android/app/`
     - `GoogleService-Info.plist` → `ios/Runner/`
   - Enable Authentication (Email/Password)
   - Enable Firestore Database

4. **Run the app**
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── note_model.dart       # Note data model
├── services/
│   ├── auth_service.dart     # Authentication logic
│   └── firestore_service.dart # Database operations
├── providers/
│   ├── auth_provider.dart    # Authentication state management
│   └── notes_provider.dart   # Notes state management
├── screens/
│   ├── auth_screen.dart      # Login/Sign up screen
│   └── notes_screen.dart     # Main notes screen
└── widgets/
    ├── note_card.dart        # Individual note display
    └── note_dialog.dart      # Add/Edit note dialog
```

## Dependencies

- `firebase_core` - Firebase initialization
- `firebase_auth` - User authentication
- `cloud_firestore` - Cloud database
- `provider` - State management

## Usage

1. **Sign Up**: Create a new account with email and password
2. **Sign In**: Login with existing credentials
3. **Add Notes**: Tap the ➕ button to create a new note
4. **Edit Notes**: Tap the edit icon on any note card
5. **Delete Notes**: Tap the delete icon and confirm deletion
6. **Sign Out**: Use the logout button in the app bar

## Architecture

The app follows Clean Architecture principles:
- **Data Layer**: Firebase services for authentication and database
- **Domain Layer**: Note model and business logic
- **Presentation Layer**: UI screens and state management with Provider

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

Your Name - your.email@example.com
Project Link: [https://github.com/yourusername/notes_app](https://github.com/yourusername/notes_app)