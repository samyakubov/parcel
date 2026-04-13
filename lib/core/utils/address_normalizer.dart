class AddressNormalizer {
  /// Keeps only the street-address portion before any city/state suffix.
  static String streetOnly(String input) {
    return input.contains(',') ? input.split(',')[0].trim() : input.trim();
  }
}
