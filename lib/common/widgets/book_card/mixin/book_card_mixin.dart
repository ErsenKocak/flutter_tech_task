import 'package:flutter/material.dart';
import 'package:flutter_tech_task/common/widgets/book_card/view/book_card_widget.dart';
import 'package:flutter_tech_task/core/init/service_locator/service_locator_provider.dart';
import 'package:flutter_tech_task/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';

mixin BookCardMixin on State<BookCardWidget> {
  late FavoritesCubit _favoritesCubit;

  @override
  void initState() {
    super.initState();
    initializeMixin();
  }

  Future<void> initializeMixin() async {
    _favoritesCubit = ServiceLocatorProvider.provide<FavoritesCubit>();
    await initializeServices();
  }

  Future<void> initializeServices() async {}

  bool checkBookIsFavorite(BookEntity book) {
    return _favoritesCubit.checkBookIsFavorite(book);
  }

  void onTapFavorite(BookEntity book) {
    _favoritesCubit.onTapFavorite(book);
  }
}
