
import 'package:intl/intl.dart';

class CustomDateFormater {
  static String getFormattedTimeDayDate(DateTime dateTime){
    // Using DateFormat to get the format '1:15pm Sun 15'
    return DateFormat('h:mma E dd').format(dateTime);
  }

  static String getFormattedYear(DateTime dateTime){
    // Using DateFormat to get the format 'Jun 2024'
    return DateFormat('MMM yyyy').format(dateTime);
  }

  static String getDayMonthYearDDMMMYYYY(DateTime dateTime){
    // Using DateFormat to get the format '18 FEB 2025'
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(dateTime);
  }

  static String getFormattedTimeInAmPm(DateTime dateTime) {
    // '09:00 PM'
    return DateFormat('hh:mm a').format(dateTime).toUpperCase();
  }

static String getFormattedDayDateMonth(DateTime dateTime) {
  // Using DateFormat to get the format 'Fri 5 Jul'
  return DateFormat('E d MMM').format(dateTime);
}

}