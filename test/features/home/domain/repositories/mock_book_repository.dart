import 'package:flutter_tech_task/features/home/data/models/response/book_model/book_model.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';

import '../../../../common/base/mock_base_result.dart';
import '../../../../common/base/mock_exception.dart';
import '../../data/repositories/repositories/i_mock_book_repository.dart';

import '../../data/services/remote/i_mock_book_service.dart';

/// Repository Katmanı veri kaynağından gelen veriyi uygulama içerisine taşıdığımız ve maplediğimiz bölümdür.
/// Model to Entity mantığı ile çalışır. Ör: Backend yapılarında Entity - DTO mantığı gibi
/// Uygulamamız Model'leri değil Entity'leri bilir.
/// Veri kaynağından gelen ve uygulamada kullanılmayacak property'leri
/// Entity içerine koymayarak mapleme esnasında alınmamasını amaçlarız.

/// final yapılmasının nedeni ise bu classtan başka bir class'ın kalıtım almasını engellemektir.
/// final yaparak Flutter'a başka bir class'ın kalıtım almayacağını taahhüt ederiz.
/// final property'ler gibi tek nesne özelliği taşıdığından performans artışıda sağlamaktadır.
final class MockBookRepository implements IMockBookRepository {
  // Dependency Injection(Constructor Injection)
  MockBookRepository(this._bookService);

  /// Injection with abstraction
  final IMockBookService _bookService;

  @override
  Future<MockResult<List<BookEntity>, MockAppException>> getBooks() async {
    final response = await _bookService.getBooks();

    return switch (response) {
      MockSuccess(value: final List<BookModel> _bookList) => MockSuccess(
          _bookList.map((e) => BookEntity.fromJson(e.toJson())).toList()),
      MockFailure(exception: final MockAppException exception) =>
        MockFailure(exception)
    };
  }

  @override
  Future<MockResult<BookEntity, MockAppException>> getBookDetail(int id) async {
    final response = await _bookService.getBookDetail(id);

    return switch (response) {
      MockSuccess(value: final BookModel _bookDetail) =>
        MockSuccess(BookEntity.fromJson(_bookDetail.toJson())),
      MockFailure(exception: final MockAppException exception) =>
        MockFailure(exception),
    };
  }
}
