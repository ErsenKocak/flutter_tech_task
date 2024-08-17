import 'package:bloc/bloc.dart';
import 'package:flutter_tech_task/common/base/cubit/base_cubit.dart';
import 'package:flutter_tech_task/common/base/cubit/base_state.dart';
import 'package:flutter_tech_task/common/base/result/base_result.dart';
import 'package:flutter_tech_task/common/base/result/exception.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/features/home/data/repositories/i_book_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> with BaseCubit {
  HomeCubit(this._bookRepository) : super(HomeState.initial());

  // Dependency Injection(Constructor Injection)
  final IBookRepository _bookRepository;

  /// Birden fazla kullanım ve farklı business'lar gerektiğinde
  /// Her yerde state'e erişmek zorunda olmadan kullanım için Cubitte tutuyoruz.
  late List<BookEntity>? bookList;
  late List<String>? publishers;
  List<BookEntity> bookSearchResult = [];
  bool isSearchActive = false;

  /// Initialize otomatik çalışacak şekilde eklenmemiştir.
  /// Cubit'in ayağa kalkması ile birlikte çalışmasını istiyorsak
  /// Constructor içerisinde çağırmalıyız.
  @override
  Future<void> initialize() async {}

  Future<void> getBooks() async {
    safeEmit(HomeState.loading());

    final response = await _bookRepository.getBooks();

    final value = switch (response) {
      Success(value: List<BookEntity> _bookList) => {
          /// Veri kaynağından gelen veriyi Cubit değişkenine atayıp State'e cubit içerisinde tuttuğumuz değişkeni veriyoruz.
          /// Bu sayede tek noktadan kullanım sağlıyoruz.
          bookList = _bookList,
          _sortBookListAscending,
          initializeSearchState(),
          _fillPublishers(bookList ?? []),

          safeEmit(HomeState.listSuccess(bookList ?? [])),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(HomeState.failure(exception)),

          /// Hata mesajlarını UI'a taşımak yerine bottom sheet üzerinde göstermek istersek kullanabiliriz
          // showErrorBottomSheet(exceptionMessage: exception.message),
        },
    };
  }

  initializeSearchState() {
    bookSearchResult.clear();
    isSearchActive = false;
  }

  void searchBook(String searchText) {
    if (searchText.isEmpty) {
      initializeSearchState();
      _fillPublishers(bookList ?? []);
      safeEmit(HomeState.listSuccess(bookList ?? []));
    } else {
      isSearchActive = true;
      bookSearchResult = bookList!
          .where((book) =>
              book.title!.toLowerCase().contains(searchText.toLowerCase()))
          .whereType<BookEntity>()
          .toList();
      _fillPublishers(bookSearchResult);
      safeEmit(HomeState.listSuccess(bookSearchResult));
    }
  }

  List<BookEntity> getBooksByPublisher(
    String publisher,
  ) {
    List<BookEntity> tempActiveList =
        isSearchActive ? bookSearchResult : bookList ?? [];

    return tempActiveList
        .where((book) => book.publisher == publisher)
        .whereType<BookEntity>()
        .toList();
  }

  void _fillPublishers(List<BookEntity> books) {
    publishers = [];

    /// Eğer bookList boş ise çalışmayacak bu yüzden ekstra kontrol eklemiyoruz.

    books.forEach(
      (book) {
        if (publishers?.contains(book.publisher) == false) {
          publishers?.add(book.publisher!);
        }
      },
    );
  }

  void get _sortBookListAscending => bookList?.sort(
        (a, b) => a.title!.compareTo(b.title!),
      );
}
