// A collection of formatting utilities for the Pokemon app

class FormatUtils {
  /// Formats the Pokemon ID with leading zeros (e.g., "001", "025", etc.)
  static String formatPokemonId(String id) {
    final numericId = int.tryParse(id);
    if (numericId == null) return id;

    if (numericId < 10) {
      return '00$numericId';
    } else if (numericId < 100) {
      return '0$numericId';
    } else {
      return id;
    }
  }

  /// Formats Pokemon height from the API (given in meters) to a readable format
  static String formatHeight(String height) {
    if (height.isEmpty) return "?";

    // Height is stored as "0.71 m"
    if (height.endsWith(" m")) {
      final double? heightValue = double.tryParse(height.replaceAll(" m", ""));
      if (heightValue != null) {
        return "${(heightValue * 100).toStringAsFixed(1)} cm";
      }
    }

    return height;
  }

  /// Formats Pokemon weight from the API (given in kg) to a readable format
  static String formatWeight(String weight) {
    if (weight.isEmpty) return "?";

    // Weight is stored as "6.9 kg"
    if (weight.endsWith(" kg")) {
      return weight;
    }

    final double? weightValue = double.tryParse(weight);
    if (weightValue != null) {
      return "$weight kg";
    }

    return weight;
  }

  /// Capitalizes the first letter of the given string
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Formats Pokemon types as comma-separated string
  static String formatTypes(List<String> types) {
    return types.map((type) => capitalize(type)).join(", ");
  }
}
