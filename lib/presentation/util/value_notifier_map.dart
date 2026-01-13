import 'package:flutter/foundation.dart';

class ValueNotifierMap<K, V> extends ValueNotifier<Map<K, V>> {
  ValueNotifierMap(Map<K, V> value) : super(value);

  void add(K key, V value) {
    this.value = Map<K, V>.from(this.value)..[key] = value;
  }

  void addAll(Map<K, V> entries) {
    this.value = Map<K, V>.from(this.value)..addAll(entries);
  }

  void remove(K key) {
    this.value = Map<K, V>.from(this.value)..remove(key);
  }

  void clear() {
    value = <K, V>{};
  }

  void update(K key, V value) {
    if (this.value.containsKey(key)) {
      this.value = Map<K, V>.from(this.value)..[key] = value;
    }
  }

  void updateWhere(bool Function(K, V) test, V newValue) {
    final updatedMap = Map<K, V>.from(value);
    for (final entry in value.entries) {
      if (test(entry.key, entry.value)) {
        updatedMap[entry.key] = newValue;
      }
    }
    this.value = updatedMap;
  }

  void updateKey(K oldKey, K newKey) {
    if (value.containsKey(oldKey)) {
      final updatedMap = Map<K, V>.from(value);
      final valueForOldKey = updatedMap.remove(oldKey);
      if (valueForOldKey != null) {
        updatedMap[newKey] = valueForOldKey;
      }
      this.value = updatedMap;
    }
  }

  void replace(Map<K, V> newMap) {
    value = Map<K, V>.from(newMap);
  }

  // Overloading operator [] for getting value
  V? operator [](K key) => value[key];

  // Overloading operator []= for assigning value
  void operator []=(K key, V value) {
    this.value = Map<K, V>.from(this.value)..[key] = value;
  }
}
