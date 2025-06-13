# Trade021Assignment Flutter App

## Overview
This Flutter app is a professional, responsive implementation of a trading dashboard UI, based on a Figma design. It is structured for maintainability, scalability, and clean code, using Provider for state management and best practices for UI/UX.

---

## Approach
- **Figma to Flutter**: The UI closely follows the provided Figma design, with careful attention to layout, spacing, and color.
- **State Management**: Uses the [Provider](https://pub.dev/packages/provider) package for clean, scalable state management.
- **Responsiveness**: The app is responsive and scrollable, with horizontal scrolling for wide tables and navigation bars, and vertical scrolling for the main content.
- **Componentization**: The UI is broken into modular, reusable widgets for clarity and maintainability.
- **Professional UX**: Consistent padding, color, and typography, with interactive elements (buttons, icons) and visual feedback.

---

## Project Structure

```
lib/
├── core/
│   └── theme/app_theme.dart        # App-wide theme and styles
├── models/
│   ├── market_stat.dart           # Model for market stats
│   └── order.dart                 # Model for orders
├── providers/
│   ├── market_provider.dart       # Provider for market stats
│   └── orders_provider.dart       # Provider for orders and pagination
├── screens/
│   └── home_screen.dart           # Main screen with all UI sections
├── widgets/
│   ├── market_header.dart         # Market stats header
│   ├── nav_bar.dart               # Navigation bar (avatar + nav items)
│   ├── search_bar.dart            # Search bar widget
│   ├── quick_access.dart          # Quick access chips/buttons
│   └── open_orders_table.dart     # Open Orders table (header, rows, footer)
└── main.dart                      # App entry point, Provider setup
```

---

## Key Features & Decisions

- **Provider State Management**: 
  - `MarketProvider` manages market stats.
  - `OrdersProvider` manages orders, pagination, and actions.
- **Responsiveness**:
  - `SingleChildScrollView` (horizontal) is used for nav bar, quick access, and tables to prevent overflow on small screens.
  - The layout adapts to different device sizes.
- **UI/UX**:
  - Consistent use of Cards, padding, and color for a clean look.
  - Interactive elements (TextButton, IconButton) for navigation and actions.
  - Table columns and headers are aligned using `Row` and `Container` with minWidth for clarity.
- **Customization**:
  - Easily add more market stats, nav items, or quick access chips by editing the relevant provider or widget.
  - The table structure can be extended for more columns or actions.

---

## How to Run
1. Ensure you have Flutter installed ([Flutter docs](https://docs.flutter.dev/get-started/install)).
2. Run `flutter pub get` to install dependencies.
3. Run `flutter run` to launch the app on your emulator or device.

---

## Customization Points
- **Add/Remove Market Stats**: Edit `MarketProvider`.
- **Add/Remove Orders**: Edit `OrdersProvider` or connect to an API.
- **Change Theme/Colors**: Edit `core/theme/app_theme.dart`.
- **Navigation Actions**: Add logic to `_NavButton` in `nav_bar.dart`.
- **Table Columns**: Adjust header and row structure in `open_orders_table.dart`.

---

## Dependencies
- [provider](https://pub.dev/packages/provider): State management
- [flutter/material.dart](https://api.flutter.dev/flutter/material/material-library.html): UI components

---

## Notes
- The app is designed for clarity and maintainability, with a focus on professional UI/UX.
- All overflow issues are handled with scroll views where appropriate.
- The codebase is ready for further extension, such as API integration, authentication, or additional screens.

---

## Screenshots
Add your screenshots here to showcase the UI on different devices.

---

## License
This project is for educational and demonstration purposes.
