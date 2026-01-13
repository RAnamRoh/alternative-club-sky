enum JourneyDirection {
  outward,
  inward,
  unavailable
}

extension JourneyDirectionExtension on JourneyDirection {
  String get name {
    switch (this) {
      case JourneyDirection.outward:
        return 'OUTWARDS';
      case JourneyDirection.inward:
        return 'INWARDS';
      case JourneyDirection.unavailable:
        return 'UNAVAILABLE';
    }
  }

  static JourneyDirection getJourneyDirectionFromString(String direction) {
    // Capitalize the input string
    final formattedDirection = direction.toUpperCase();

    // Match the formatted string to the enum values
    switch (formattedDirection) {
      case 'OUTWARDS':
        return JourneyDirection.outward;
      case 'INWARDS':
        return JourneyDirection.inward;
      default:
        return JourneyDirection.unavailable; // Return null if no match is found
    }
  }

}