import 'package:flutter_tech_task/common/base/result/base_result.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/base/mock_base_result.dart';
import '../../common/base/mock_exception.dart';
import '../../core/init/service_locator/mock_service_locator.dart'
    as dependencyInjection;
import '../../core/init/service_locator/mock_service_locator_provider.dart';
import 'data/repositories/repositories/i_mock_book_repository.dart';
import 'data/services/remote/i_mock_book_service.dart';

/// Örnek olarak Mockhito kullanarak classlarımız mocklayıp ekstra kod yazmadan kolayca test edebiliriz.
/// Generated Mockito ile initialize etmekte zorlanacağımız durumlarda kendi mock classlarımızı oluşturabiliriz.
/// final ve sealed gibi classlarda mockito desteği bulunmamaktadır.
// @GenerateMocks([Dio, NetworkClient, BookService])
Future<void> main() async {
  await dependencyInjection.initalize();

  IMockBookService bookService =
      MockServiceLocatorProvider.provide<IMockBookService>();
  IMockBookRepository bookRepository =
      MockServiceLocatorProvider.provide<IMockBookRepository>();

  group(
    'Book List Tests',
    () {
      test('Books delivered Successfully', () async {
        final result = await bookRepository.getBooks();

        expect(result, isA<MockSuccess>());

        final bookListValue = switch (result) {
          MockSuccess(value: List<BookEntity> _bookList) => {},
          MockFailure(exception: final MockAppException exception) => {},
        };
      });

      test('Book list type safe', () async {
        final result = await bookRepository.getBooks();

        final bookList;

        final bookListValue = switch (result) {
          MockSuccess(value: List<BookEntity> _bookList) => {
              bookList = _bookList,
              expect(bookList, isA<List<BookEntity>>()),
            },
          MockFailure(exception: final MockAppException exception) => {
              bookList = null,
              expect(exception.message.isNotEmpty, true)
            },
        };
      });
    },
  );
}
