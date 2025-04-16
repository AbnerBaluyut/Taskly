extension NullableStringExtension on String? {

  bool get isBlank => this?.trim().isEmpty ?? false;

  bool get isNotBlank => this?.trim().isNotEmpty ?? false;

  bool get isNullOrBlank => this == null || this!.trim().isEmpty;
}