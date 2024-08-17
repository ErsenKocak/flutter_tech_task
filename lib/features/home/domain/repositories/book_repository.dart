import 'package:collection/collection.dart';
import 'package:flutter_tech_task/common/base/result/base_result.dart';
import 'package:flutter_tech_task/common/base/result/exception.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/common/logger/app_logger.dart';
import 'package:flutter_tech_task/core/constants/cache/cache_constants.dart';
import 'package:flutter_tech_task/features/home/data/models/response/book_model/book_model.dart';
import 'package:flutter_tech_task/features/home/data/services/local/i_book_local_service.dart';
import 'package:flutter_tech_task/features/home/data/services/remote/i_book_service.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/features/home/data/repositories/i_book_repository.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';
import 'package:flutter_tech_task/helper/network/internet_connection_check/internet_connection_check_helper.dart';

/// Repository Katmanı veri kaynağından gelen veriyi uygulama içerisine taşıdığımız ve maplediğimiz bölümdür.
/// Model to Entity mantığı ile çalışır. Ör: Backend yapılarında Entity - DTO mantığı gibi
/// Uygulamamız Model'leri değil Entity'leri bilir.
/// Veri kaynağından gelen ve uygulamada kullanılmayacak property'leri
/// Entity içerine koymayarak mapleme esnasında alınmamasını amaçlarız.

/// final yapılmasının nedeni ise bu classtan başka bir class'ın kalıtım almasını engellemektir.
/// final yaparak Flutter'a başka bir class'ın kalıtım almayacağını taahhüt ederiz.
/// final property'ler gibi tek nesne özelliği taşıdığından performans artışıda sağlamaktadır.
final class BookRepository implements IBookRepository {
  // Dependency Injection(Constructor Injection)
  BookRepository(this._bookService, this._bookLocalService,
      this._internetConnectionHelper);

  /// Injection with abstraction
  final IBookService _bookService;
  final IBookLocalService _bookLocalService;
  final InternetConnectionCheckerHelper _internetConnectionHelper;

  @override
  Future<Result<List<BookEntity>, AppException>> getBooks() async {
    bool connectivityResult =
        await _internetConnectionHelper.checkConnectivity();

    if (connectivityResult) {
      return await _getBooksFromAPI();
    } else {
      return await _getBooksFromCache();
    }
  }

  Future<Result<List<BookEntity>, AppException>> _getBooksFromAPI() async {
    final response = await _bookService.getBooks();

    final value = switch (response) {
      Success(value: final List<BookModel> _bookList) =>
        Success(_bookList.map((e) => BookEntity.fromJson(e.toJson())).toList()),
      Failure(exception: final AppException exception) => Failure(exception)
    };

    if (value is Success) {
      _updateCachedBooks((value).value);
    }

    return value as Result<List<BookEntity>, AppException>;
  }

  Future<Result<List<BookEntity>, AppException>> _getBooksFromCache() async {
    List<BookEntity>? bookList = [];
    final response = await _bookLocalService.get(CacheConstants.Book.name);

    AppLogger.call(title: 'Books Local Repository', value: response);
    if (response?.isNullOrEmpty == false) {
      bookList = response?.map((e) => BookEntity.fromJson(e)).toList();

      return Success(bookList!);
    } else {
      return Failure(
          AppException(LocaleKeys.Home_BooksCouldNotBeDelivered.toString()));
    }
  }

  @override
  Future<Result<BookEntity, AppException>> getBookDetail(int id) async {
    bool connectivityResult =
        await _internetConnectionHelper.checkConnectivity();

    if (connectivityResult) {
      return await _getBookDetailFromAPI(id);
    } else {
      return await _getBookDetailFromCache(id);
    }
  }

  Future<Result<BookEntity, AppException>> _getBookDetailFromAPI(int id) async {
    final response = await _bookService.getBookDetail(id);

    return switch (response) {
      Success(value: final BookModel _bookDetail) =>
        Success(BookEntity.fromJson(_bookDetail.toJson())),
      Failure(exception: final AppException exception) => Failure(exception),
    };
  }

  Future<Result<BookEntity, AppException>> _getBookDetailFromCache(
      int id) async {
    Result<List<BookEntity>, AppException> cacheResponse =
        await _getBooksFromCache();

    final cacheValue = switch (cacheResponse) {
      Success(value: final List<BookEntity> _bookList) =>
        Success(_bookList.map((e) => BookEntity.fromJson(e.toJson())).toList()),
      Failure(exception: final AppException exception) => Failure(exception)
    };

    if (cacheValue is Success) {
      BookEntity? bookDetail = ((cacheValue).value as List<BookEntity>)
          .firstWhereOrNull((book) => book.id == id);
      if (bookDetail.isNotNull) {
        return Success(bookDetail!);
      }
    }

    return Failure(AppException(LocaleKeys
        .BookDetail_BookDetailInformationCouldNotBeDelivired.toString()));
  }

  void _updateCachedBooks(List<BookEntity> books) {
    _bookLocalService.put(CacheConstants.Book.name, books);
  }
}
