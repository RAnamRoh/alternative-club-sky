import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateToString {
  static String dateToString(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }


  static String dateToShortString(DateTime date) {
    var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    return "${date.day} ${monthNames[date.month - 1]}, ${date.year}";
  }

  static String dateToCompactString(DateTime date) {
    var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    return "${date.day} ${monthNames[date.month - 1]}, ${date.year % 100}"; // Extract last two digits of the year
  }

  static String dateToMonthDayYearString(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date).toUpperCase();
  }

  static String dateToDayMonthYearCompact(DateTime date) {
    return DateFormat('dd-MMM-yy').format(date).toLowerCase();
  }

  static String timeOnly(DateTime date) {
    return DateFormat('h:mm').format(date);
  }

  static String dayMonthYearTime(DateTime date) {
    return DateFormat('dd-MMM-yy h:mm').format(date).toLowerCase();
  }

  static String formatToIso8601(DateTime dateTime) {
    return dateTime.toIso8601String().split('.')[0];
  }

  static String formatDateForDOB(DateTime dateTime) {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }



}