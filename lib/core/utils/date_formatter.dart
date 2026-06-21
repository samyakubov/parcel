import 'package:intl/intl.dart';

class DateFormatter {
  static final _fmt = DateFormat.yMMMMd();

  static String format(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty || dateStr == 'N/A') return 'N/A';
    try {
      return _fmt.format(DateTime.parse(dateStr));
    } catch (e) {
      return dateStr;
    }
  }
}
