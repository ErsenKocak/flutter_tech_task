import 'package:flutter_tech_task/core/constants/cache/cache_constants.dart';
import 'package:flutter_tech_task/features/home/data/services/local/i_book_local_service.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:hive/hive.dart';

final class BookLocalService extends IBookLocalService {
  @override
  String get boxName => CacheConstants.Book.name;

  @override
  void registerAdapters() {
    Hive.registerAdapter(
      CacheConstants.FavoriteBooks.name,
      (json) => json?.map((e) => BookEntity.fromJson(e)).toList(),
    );
  }
}
