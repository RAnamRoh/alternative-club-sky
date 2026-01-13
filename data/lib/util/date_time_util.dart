
import 'package:intl/intl.dart';


class DateTimeUtils {
  /// Adjusts a given [dateTime] by applying the [offset].
  /// [offset] should be in the format ±HH:mm (e.g., +11:00, -05:30).

  static DateTime? applyOffsetToDateTime(DateTime date, String offset) {
    try {
      // Parse the offset string (format: "HH:mm:ss±hh:mm")
      final timePattern = RegExp(r'^(\d{2}):(\d{2}):(\d{2})([+-])(\d{2}):(\d{2})$');
      final match = timePattern.firstMatch(offset);

      if (match == null) {
        throw FormatException('Invalid offset format');
      }

      // Extract time components
      final hours = int.parse(match.group(1)!);
      final minutes = int.parse(match.group(2)!);

      // Extract timezone offset
      final isPositive = match.group(4) == '+';
      final tzHours = int.parse(match.group(5)!);
      final tzMinutes = int.parse(match.group(6)!);

      // First apply timezone offset
      final tzOffset = Duration(
        hours: isPositive ? tzHours : -tzHours,
        minutes: isPositive ? tzMinutes : -tzMinutes,
      );

      // Then set the time of day
      final adjustedDate = date.add(tzOffset);
      return DateTime(
        adjustedDate.year,
        adjustedDate.month,
        adjustedDate.day,
        hours,
        minutes,
      );
    } catch (e) {
      print('Error applying offset: $e');
      return null;
    }
  }


  static String formatToIso8601(DateTime dateTime) {
    return dateTime.toIso8601String().split('.')[0];
  }

  static String formatDateForDOB(DateTime dateTime) {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  static String getDayMonthYearDDMMMYYYY(DateTime dateTime){
    // Using DateFormat to get the format '18 FEB 2025'
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(dateTime);
  }


}