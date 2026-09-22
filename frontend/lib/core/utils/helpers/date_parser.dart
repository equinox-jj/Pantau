/// Parses an API date value that may arrive as a String, a DateTime, or null.
DateTime? parseDate(dynamic value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  if (value is String) return DateTime.tryParse(value);

  return null;
}
