import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_tech_task/common/base/cubit/base_cubit.dart';
import 'package:flutter_tech_task/common/base/cubit/base_state.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/features/favorites/data/repositories/i_favorites_repository.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

class FavoritesCubit extends Cubit<FavoritesState> with BaseCubit {
  FavoritesCubit(this._favoritesRepository) : super(FavoritesState.initial());

  final IFavoritesRepository _favoritesRepository;
  late List<BookEntity> favoriteBooks;
  late List<String> publishers;

  @override
  Future<void> initialize() async {
    await getFavoriteBooksFromCache();
  }

  Future<void> getFavoriteBooksFromCache() async {
    safeEmit(FavoritesState.loading());

    final response = await _favoritesRepository.getFavoriteBooksFromCache();

    if (response.isNullOrEmpty == true) {
      favoriteBooks = [];
      _fillPublishers();
      safeEmit(FavoritesState.failure(
          LocaleKeys.Favorites_ThereAreNoFavoritedBooks.tr()));
    } else {
      favoriteBooks = response!;
      _fillPublishers();
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
    await getFavoriteBooksFromCache();
  }

  void _addFavorites(BookEntity book) {
    favoriteBooks.add(book);
    log('Add Favorites ${favoriteBooks.length}');
    // AppLogger.call(title: 'Add Favorites', value: favoriteBooks);
    _favoritesRepository.updateFavoritesCache(favoriteBooks);
  }

  void _removeFavorites(BookEntity book) {
    favoriteBooks.remove(book);
    _favoritesRepository.updateFavoritesCache(favoriteBooks);
  }

  void _fillPublishers() {
    publishers = [];

    /// Eğer bookList boş ise çalışmayacak bu yüzden ekstra kontrol eklemiyoruz.

    favoriteBooks.forEach(
      (book) {
        if (publishers.contains(book.publisher) == false) {
          publishers.add(book.publisher!);
        }
      },
    );
  }

  List<BookEntity> getBooksByPublisher(
    String publisher,
  ) {
    return favoriteBooks
        .where((book) => book.publisher == publisher)
        .whereType<BookEntity>()
        .toList();
  }
}
