class AddressNormalizer {
  static String streetOnly(String input) {
    return input.contains(',') ? input.split(',')[0].trim() : input.trim();
  }
}
