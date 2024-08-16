import 'package:flutter_tech_task/common/base/result/base_result.dart';
import 'package:flutter_tech_task/common/base/result/exception.dart';
import 'package:flutter_tech_task/features/book_detail/data/models/response/book_detail_model/book_detail_model.dart';
import 'package:flutter_tech_task/features/book_detail/domain/entities/response/book_detail_entity/book_detail_entity.dart';
import 'package:flutter_tech_task/features/home/data/models/response/book_model/book_model.dart';
import 'package:flutter_tech_task/features/home/data/services/i_book_service.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/features/home/domain/repositories/i_book_repository.dart';

/// Repository Katmanı veri kaynağından gelen veriyi uygulama içerisine taşıdığımız ve maplediğimiz bölümdür.
/// Model to Entity mantığı ile çalışır. Ör: Backend yapılarında Entity - DTO mantığı gibi
/// Uygulamamız Model'leri değil Entity'leri bilir.
/// Veri kaynağından gelen ve uygulamada kullanılmayacak property'leri
/// Entity içerine koymayarak mapleme esnasında alınmamasını amaçlarız.

/// final yapılmasının nedeni ise bu classtan başka bir class'ın kalıtım almasını engellemektir.
/// final yaparak Flutter'a başka bir class'ın kalıtım almayacağını taahhüt ederiz.
/// final property'ler gibi tek nesne özelliği taşıdığından performans artışıda sağlamaktadır.
final class BookRepository implements IBookRepository {
  /// Injection with abstraction
  final IBookService _bookService;

  // Dependency Injection(Constructor Injection)
  BookRepository(this._bookService);

  @override
  Future<Result<List<BookEntity>, AppException>> getBooks() async {
    final response = await _bookService.getBooks();

    return switch (response) {
      Success(value: final List<BookModel> _bookList) =>
        Success(_bookList.map((e) => BookEntity.fromJson(e.toJson())).toList()),
      Failure(exception: final AppException exception) => Failure(exception)
    };
  }

  @override
  Future<Result<BookDetailEntity, AppException>> getBookDetail(int id) async {
    final response = await _bookService.getBookDetail(id);

    return switch (response) {
      Success(value: final BookDetailModel _bookDetail) =>
        Success(BookDetailEntity.fromJson(_bookDetail.toJson())),
      Failure(exception: final AppException exception) => Failure(exception),
    };
  }
}
