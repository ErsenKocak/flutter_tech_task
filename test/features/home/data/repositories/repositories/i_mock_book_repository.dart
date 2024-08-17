import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';

import '../../../../../common/base/mock_base_result.dart';
import '../../../../../common/base/mock_exception.dart';

abstract class IMockBookRepository {
  Future<MockResult<List<BookEntity>, MockAppException>> getBooks();
  Future<MockResult<BookEntity, MockAppException>> getBookDetail(int id);
}
