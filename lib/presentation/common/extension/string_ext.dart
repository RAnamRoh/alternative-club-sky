import 'dart:ui';

// extension HexColorString on String {
//   Color hexToColor() => Color(int.parse(replaceAll('#', '0xFF')));
// }

extension HexColorString on String {
  Color hexToColor() {
    // Remove any non-hexadecimal characters
    final cleanedString = replaceAll(RegExp(r'[^0-9A-Fa-f]'), '');
    // Ensure the string has at least 6 characters (for RGB)
    if (cleanedString.length < 6) {
      throw FormatException('Invalid hex color code');
    }
    // Prepend '0xFF' to the cleaned string
    final hexString = '0xFF${cleanedString.substring(cleanedString.length - 6)}';
    return Color(int.parse(hexString));
  }
}