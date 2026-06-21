import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String get mapboxApiKey =>  dotenv.env['MAPBOX_API_KEY'] ?? '';
  static String get baseUrl =>  dotenv.env['SERVER_URL'] ?? 'http://127.0.0.1:8000';
  static String get backendApiKey => dotenv.env['BACKEND_API_KEY'] ?? '';
  static String get streetViewApiKey => dotenv.env['STREETVIEW_API_KEY'] ?? '';

  static const int autocompleteDebounceMs = 350;
  static const int autocompleteMinChars = 2;
  static const int autocompleteMaxResults = 5;

  static const double bottomNavBarHeight = 64.0;
}
