import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String get mapboxApiKey => dotenv.isInitialized ? (dotenv.env['MAPBOX_API_KEY'] ?? '') : '';
  static String get baseUrl => dotenv.isInitialized ? (dotenv.env['SERVER_URL'] ?? 'http://127.0.0.1:8000') : 'http://127.0.0.1:8000';
  static String get backendApiKey => dotenv.isInitialized ? (dotenv.env['BACKEND_API_KEY'] ?? '') : '';
  static String get streetViewApiKey => dotenv.isInitialized ? (dotenv.env['STREETVIEW_API_KEY'] ?? '') : '';
}
