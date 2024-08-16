import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_tech_task/common/base/cubit/base_cubit.dart';
import 'package:flutter_tech_task/common/base/cubit/base_state.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/common/logger/app_logger.dart';
import 'package:flutter_tech_task/features/favorites/data/repositories/i_favorites_repository.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

class FavoritesCubit extends Cubit<FavoritesState> with BaseCubit {
  FavoritesCubit(this._favoritesRepository) : super(FavoritesState.initial());

  final IFavoritesRepository _favoritesRepository;
  late List<BookEntity> favoriteBooks;

  @override
  Future<void> initialize() async {
    await getFavoriteBooks();
  }

  Future<void> getFavoriteBooks() async {
    safeEmit(FavoritesState.loading());

    final response = await _favoritesRepository.getFavoriteBooks();

    if (response.isNullOrEmpty == true) {
      AppLogger.call(
        title: 'Favorite Book Null Or Empty',
      );

      favoriteBooks = response!;
      safeEmit(
          FavoritesState.failure('Favoriye alınmış kitap bulunmamaktadır.'));
    } else {
      favoriteBooks = response!;
      safeEmit(FavoritesState.success(favoriteBooks));
    }
  }

  bool checkBookIsFavorite(BookEntity book) {
    bool isFavorite = favoriteBooks.contains(book);

    return isFavorite;
  }

  Future<void> onTapFavorite(BookEntity book) async {
    if (checkBookIsFavorite(book)) {
      _removeFavorites(book);
    } else {
      _addFavorites(book);
    }

    safeEmit(FavoritesState.success(favoriteBooks));
    await getFavoriteBooks();
  }

  void _addFavorites(BookEntity book) {
    favoriteBooks.add(book);
    log('Add Favorites ${favoriteBooks.length}');
    // AppLogger.call(title: 'Add Favorites', value: favoriteBooks);
    _favoritesRepository.updateFavorites(favoriteBooks);
  }

  void _removeFavorites(BookEntity book) {
    favoriteBooks.remove(book);
    _favoritesRepository.updateFavorites(favoriteBooks);
  }
}
