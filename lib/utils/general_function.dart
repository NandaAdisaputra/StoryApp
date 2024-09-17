double convertToDouble(dynamic value) {
  if (value is String) {
    return double.tryParse(value) ?? 0.0;
  } else if (value is int) {
    return value.toDouble();
  } else {
    return value ?? 0.0;
  }
}
