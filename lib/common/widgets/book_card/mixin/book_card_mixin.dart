
import 'package:flutter/material.dart';
import 'package:flutter_tech_task/common/widgets/book_card/view/book_card_widget.dart';
import 'package:flutter_tech_task/core/init/service_locator/service_locator_provider.dart';
import 'package:flutter_tech_task/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:flutter_tech_task/helper/color/color_schema_entity.dart';
import 'package:flutter_tech_task/helper/color/random_color_helper.dart';

mixin BookCardMixin on State<BookCardWidget> {
  late FavoritesCubit _favoritesCubit;
  late NotificationCubit _notificationCubit;
  late ColorSchemaEntity colorSchema;

  @override
  void initState() {
    super.initState();
    initializeMixin();
  }

  Future<void> initializeMixin() async {
    _favoritesCubit = ServiceLocatorProvider.provide<FavoritesCubit>();
    _notificationCubit = ServiceLocatorProvider.provide<NotificationCubit>();
    colorSchema = RandomColorHelper.getRandomColorSchema;
    await initializeServices();
  }

  Future<void> initializeServices() async {}

  bool checkBookIsFavorite(BookEntity book) {
    return _favoritesCubit.checkBookIsFavorite(book);
  }

  bool checkBookHasNotification(BookEntity book) {
    return _notificationCubit.checkBookHasNotification(book);
  }

  Future<void> onTapNotification(BookEntity book) async {
    await _notificationCubit.onTapSetNotification(book);
  }

  Future<void> onTapFavorite(BookEntity book) async {
    await _favoritesCubit.onTapFavorite(book);
  }
}
