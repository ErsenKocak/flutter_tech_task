import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/init/service_locator/service_locator_provider.dart';
import 'package:flutter_tech_task/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter_tech_task/features/favorites/presentation/view/favorites_view.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/features/home/presentation/cubit/home_cubit.dart';

mixin FavoritesMixin on State<FavoritesView> {
  late FavoritesCubit favoritesCubit;
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    initializeMixin();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initializeMixin() async {
    favoritesCubit = ServiceLocatorProvider.provide<FavoritesCubit>();
    homeCubit = ServiceLocatorProvider.provide<HomeCubit>();
    await initializeServices();
  }

  List<BookEntity> getBookByPublisher(String publisher) =>
      favoritesCubit.getBooksByPublisher(publisher);

  Future<void> initializeServices() async {
    await favoritesCubit.getFavoriteBooksFromCache();
  }
}
