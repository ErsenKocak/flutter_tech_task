import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/init/service_locator/service_locator_provider.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_tech_task/features/home/presentation/view/home_view.dart';

/// Bu tanımlama ile birlikte HomeMixin yapısının sadece
/// HomeView özelinde kullanılmasını sağlıyoruz.
/// Aynı zamanda da Stateful bir widget gibi özellikleri kazanıyoruz.
/// Ör: initState, dispose methodları
mixin HomeMixin on State<HomeView> {
  /// View'dan erişim durumları için private yapmıyoruz.

  late final HomeCubit homeCubit;
  late TextEditingController searchInputController;

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
    searchInputController = TextEditingController();
    homeCubit = ServiceLocatorProvider.provide<HomeCubit>();
    initializeSearchInputListener();
    await initializeServices();
  }

  Future<void> initializeServices() async {
    await getBooks();
  }

  void initializeSearchInputListener() {
    searchInputController.addListener(
      () {
        searchBook();
      },
    );
  }

  Future<void> getBooks() async {
    await homeCubit.getBooks();
  }

  List<BookEntity> getBookByPublisher(String publisher) =>
      homeCubit.getBooksByPublisher(publisher);

  void searchBook() {
    homeCubit.searchBook(searchInputController.text);
  }
}
