extension IterableCheckExtension<T> on Iterable<T>? {
  /// Returns true if the iterable is null or empty.
  bool get isEmptyOrNull => this == null || this!.isEmpty;

  /// Returns true if the iterable is not null and not empty.
  bool get isNotEmptyOrNull => this != null && this!.isNotEmpty;
}

extension MapCheckExtension<K, V> on Map<K, V>? {
  /// Returns true if the map is null or empty.
  bool get isEmptyOrNull => this == null || this!.isEmpty;

  /// Returns true if the map is not null and not empty.
  bool get isNotEmptyOrNull => this != null && this!.isNotEmpty;
}