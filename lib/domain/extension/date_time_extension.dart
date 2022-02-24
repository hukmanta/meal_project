import 'package:intl/intl.dart';

///import file [StringExtension] agar dapat menggunakan code ini
extension DateTimeExtension on DateTime{

  /// mencetak Datetime sesuai @param [pattern] yang ditentukan dan @param [locale] sebagai standar lokal yg dipakai
  String printByPattern({String pattern="dd MMM yyyy - HH:mm", String locale='id'}){
    DateFormat dateFormat = DateFormat(pattern, locale);
    return  dateFormat.format(toLocal());
  }

  /// mengubah tanggal ke hari pertama dalam satu minggu
  DateTime toFirstDateOfWeek() {
    switch (weekday) {
      case DateTime.tuesday:
        return subtract(const Duration(days: 1));
      case DateTime.wednesday:
        return subtract(const Duration(days: 2));
      case DateTime.thursday:
        return subtract(const Duration(days: 3));
      case DateTime.friday:
        return subtract(const Duration(days: 4));
      case DateTime.saturday:
        return subtract(const Duration(days: 5));
      case DateTime.sunday:
        return subtract(const Duration(days: 6));
      default:
        return this;
    }
  }

  /// mengubah tanggal ke hari terakhir dalam satu minggu
  DateTime toLastDateOfWeek() {
    switch (weekday) {
      case DateTime.saturday:
        return add(const Duration(days: 1));
      case DateTime.friday:
        return add(const Duration(days: 2));
      case DateTime.thursday:
        return add(const Duration(days: 3));
      case DateTime.wednesday:
        return add(const Duration(days: 4));
      case DateTime.tuesday:
        return add(const Duration(days: 5));
      case DateTime.monday:
        return add(const Duration(days: 6));
      default:
        return this;
    }
  }

  /// menggubah tanggal ke hari kerja
  DateTime lastDateForLeaveOrPermit() {
    switch (weekday) {
      case DateTime.saturday:
        return add(const Duration(days: 2));
      case DateTime.sunday:
        return add(const Duration(days: 1));
      default:
        return this;
    }
  }

}