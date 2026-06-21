import 'package:intl/intl.dart';

final numberFmt = NumberFormat('#,###');
final dateFmt = DateFormat('MM/dd/yyyy');
final currencyFmt = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

String fmtPrice(double p) {
  if (p >= 1000000) return '\$${(p / 1000000).toStringAsFixed(1)}M';
  if (p >= 1000) return '\$${(p / 1000).round()}K';
  return '\$${p.round()}';
}

String fmtDim(double v) => v % 1 == 0 ? v.toInt().toString() : v.toStringAsFixed(1);

String fmtSqft(double? sqft, double? front, double? depth, {bool inline = false}) {
  if (sqft == null) return 'N/A';
  final base = '${numberFmt.format(sqft.round())} ft²';
  if (front != null && depth != null) {
    final dims = '${fmtDim(front)}×${fmtDim(depth)}';
    return inline ? '$base ($dims)' : '$base\n$dims';
  }
  return base;
}
