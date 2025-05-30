import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get imageBaseUrl => dotenv.env['IMAGE_BASE_URL'] ?? '';
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? '';
}