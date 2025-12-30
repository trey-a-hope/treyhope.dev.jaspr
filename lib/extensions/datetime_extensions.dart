extension DateTimeExtensions on DateTime {
  String get formatDate {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[month - 1]} ${day}, ${year}';
  }
}
