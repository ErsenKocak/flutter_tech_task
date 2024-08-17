import 'package:flutter_tech_task/core/cache/i_cache_manager.dart';
import 'package:hive/hive.dart';

abstract class HiveCacheManager<T> extends ICacheManager<T> {
  String get boxName;
  Box<T>? box;

  @override
  Future<void> initialize() async {
    registerAdapters();
    if (box?.isOpen != true) {
      box = await Hive.box<T>(name: boxName);
    }
  }

  void registerAdapters();

  @override
  Future<T?> get(String key) async {
    final value = await box?.get(key);
    return value;
  }

  @override
  List<T?>? getAll(Iterable<String> keys) {
    return box?.getAll(keys).toList();
  }

  @override
  void add(T item) {
    box?.add(item);
  }

  @override
  void addList(List<T> items) {
    box?.addAll(items);
  }

  @override
  bool? delete(String key) {
    return box?.delete(key);
  }

  @override
  void put(String key, T item) async {
    box?.put(key, item);
  }

  @override
  void putAll(Map<String, T> mapObject) async {
    box?.putAll(mapObject);
  }

  @override
  Future<void> deleteAll(Iterable<String> keys) async {
    box?.deleteAll(keys);
  }

  @override
  void clear({bool notify = true}) async {
    box?.clear(notify: notify);
  }
}
