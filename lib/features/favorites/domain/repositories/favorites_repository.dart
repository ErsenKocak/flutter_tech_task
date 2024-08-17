
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/common/logger/app_logger.dart';
import 'package:flutter_tech_task/core/constants/cache/cache_constants.dart';
import 'package:flutter_tech_task/features/favorites/data/repositories/i_favorites_repository.dart';
import 'package:flutter_tech_task/features/favorites/data/services/i_favorites_local_service.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';

final class FavoritesRepository implements IFavoritesRepository {
  FavoritesRepository(this._favoritesLocalService);

  final IFavoritesLocalService _favoritesLocalService;

  @override
  Future<List<BookEntity>?> getFavoriteBooksFromCache() async {
    List<BookEntity>? bookList = [];
    final response =
        await _favoritesLocalService.get(CacheConstants.FavoriteBooks.name);

    AppLogger.call(title: 'Favorite Books Repository', value: response);
    if (response.isNullOrEmpty == false) {
      bookList = response?.map((e) => BookEntity.fromJson(e)).toList();
    }

    return bookList;
  }

  @override
  void updateFavoritesCache(List<BookEntity> favoriteBooks) {
    _favoritesLocalService.put(
        CacheConstants.FavoriteBooks.name, favoriteBooks);
  }
}
