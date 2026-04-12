import 'package:intl/intl.dart';

class DateFormatter {
  /// Formats a raw ISO date string (YYYY-MM-DD or similar) into 
  /// a human-readable format like "October 14, 2023".
  static String format(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty || dateStr == 'N/A') return 'N/A';
    try {
      // DateTime.parse handles standard ISO 8601 strings
      final date = DateTime.parse(dateStr);
      return DateFormat.yMMMMd().format(date);
    } catch (e) {
      // Fallback: return original if parsing fails
      return dateStr;
    }
  }
}
