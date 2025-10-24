# 📚 Recipe Book Flutter

> A beautiful and intuitive recipe management app built with Flutter, featuring bilingual support and modern UI design.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

## ✨ Features

- 🍳 **Recipe Management**: Browse, view, and add your favorite recipes
- ❤️ **Favorites System**: Save and organize your most-loved recipes
- 🌙 **Dark/Light Theme**: Toggle between beautiful themes with a single tap
- 🌍 **Bilingual Support**: Available in English and Spanish
- 📱 **Responsive Design**: Optimized for mobile devices
- 🎨 **Modern UI**: Clean, intuitive interface with Material Design principles
- 📝 **Recipe Details**: View step-by-step cooking instructions
- 🖼️ **Image Support**: Visual recipe cards with network images

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- iOS Simulator / Android Emulator (for testing)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/recipe_book_flutter.git
   cd recipe_book_flutter
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🏗️ Project Structure

```
lib/
├── l10n/                    # 🌍 Localization files
│   ├── app_localizations.dart
│   ├── en.arb              # English translations
│   └── es.arb              # Spanish translations
├── models/                  # 📊 Data models
│   └── recipe_model.dart
├── providers/               # 🔄 State management
│   ├── recipes_provider.dart
│   └── theme_provider.dart
├── screens/                 # 📱 UI screens
│   ├── home_screen.dart
│   ├── recipe_detail.dart
│   └── favorite_recipes_screen.dart
├── theme/                   # 🎨 App theming
│   └── theme.dart
└── main.dart               # 🚀 App entry point
```

## 🛠️ Tech Stack

- **Framework**: Flutter 3.9.2+
- **Language**: Dart
- **State Management**: Provider
- **Localization**: Flutter Intl
- **HTTP Client**: http package
- **UI**: Material Design 3

## 📱 Screenshots

_Coming soon - screenshots of the app in action!_

## 🎯 Key Features Explained

### Recipe Management

- Browse through a collection of recipes with beautiful card layouts
- Tap any recipe to view detailed cooking instructions
- Add new recipes with a comprehensive form

### Favorites System

- Mark recipes as favorites for quick access
- Dedicated favorites tab for easy navigation
- Persistent storage of favorite recipes

### Theme Support

- Seamless switching between light and dark themes
- Theme preference is maintained across app sessions
- Modern Material Design 3 theming

### Internationalization

- Full support for English and Spanish
- Easy to extend with additional languages
- Localized UI elements and content

## 🔧 Development

### Adding New Languages

1. Create a new `.arb` file in `lib/l10n/`
2. Add translations following the existing pattern
3. Update `supportedLocales` in `main.dart`
4. Run `flutter gen-l10n` to generate localization files

### State Management

The app uses Provider for state management:

- `RecipesProvider`: Manages recipe data and API calls
- `ThemeProvider`: Handles theme switching and persistence

## 📦 Dependencies

- `provider: ^6.1.2` - State management
- `http: ^1.5.0` - HTTP requests
- `flutter_localizations` - Internationalization
- `intl: ^0.20.2` - Date and number formatting

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design team for the beautiful design system
- The open-source community for inspiration and support
- Platzi team for the amazing course

---

**Last Updated**: October 2025

_Made with ❤️ and Flutter_
