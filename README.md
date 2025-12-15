# Scube Task App

A Flutter application with a beautiful login interface.

## Features

- **Login Page**: Clean design with blue gradient top half and white rounded bottom half
- **Form Validation**: Username and password field validation
- **Navigation**: Seamless navigation from login to home page
- **iOS Compatible**: Designed to run on iOS simulator

## Design

The login page features:
- Top half: Blue gradient background with app logo and welcome text
- Bottom half: White background with rounded top corners containing:
  - Username input field with person icon
  - Password input field with lock icon
  - Login button with blue styling

## Getting Started

### Prerequisites
- Flutter SDK installed
- iOS Simulator (for iOS testing)
- Xcode (for iOS development)

### Installation

1. Clone the repository:
```bash
git clone <your-repository-url>
cd scube_task_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart          # App entry point
├── login_page.dart    # Login page with custom design
└── home_page.dart     # Home page (placeholder)
```

## Usage

1. Launch the app
2. Enter any username and password (dummy validation)
3. Tap the "Login" button to navigate to the home page

## Screenshots

The app features a modern, clean design with:
- Blue gradient header with app branding
- Rounded white form section
- Material Design input fields
- Smooth navigation transitions

## Development

This is a frontend-only implementation with dummy backend values. The login accepts any valid input and navigates to the home page.

## License

This project is created for demonstration purposes.