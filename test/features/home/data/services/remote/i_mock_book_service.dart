import 'package:flutter_tech_task/features/home/data/models/response/book_model/book_model.dart';

import '../../../../../common/base/mock_base_result.dart';
import '../../../../../common/base/mock_exception.dart';

abstract class IMockBookService {
  Future<MockResult<List<BookModel>, MockAppException>> getBooks();
  Future<MockResult<BookModel, MockAppException>> getBookDetail(int id);
}
