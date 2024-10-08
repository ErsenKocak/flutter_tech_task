import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';

abstract class IFavoritesRepository {
  Future<List<BookEntity>?> getFavoriteBooksFromCache();
  void updateFavoritesCache(List<BookEntity> favoriteBooks);
}
