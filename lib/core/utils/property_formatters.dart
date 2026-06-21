import 'package:intl/intl.dart';

final numberFmt = NumberFormat('#,###');
final dateFmt = DateFormat('MM/dd/yyyy');

String fmtPrice(double p) => p >= 1000000
    ? '\$${(p / 1000000).toStringAsFixed(1)}M'
    : '\$${(p / 1000).round()}K';

String fmtDim(double v) => v % 1 == 0 ? v.toInt().toString() : v.toStringAsFixed(1);
