import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  // May 29, 2025
  String get formatDate {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[month - 1]} ${day}, ${year}';
  }

  // 2025-05-29
  String get formatDateString => DateFormat('yyyy-MM-dd').format(this);
}
