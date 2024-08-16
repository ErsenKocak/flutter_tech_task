import 'package:flutter_tech_task/common/base/result/base_result.dart';
import 'package:flutter_tech_task/common/base/result/exception.dart';
import 'package:flutter_tech_task/features/book_detail/data/models/response/book_detail_model/book_detail_model.dart';
import 'package:flutter_tech_task/features/home/data/models/response/book_model/book_model.dart';

abstract class IBookService {
  Future<Result<List<BookModel>, AppException>> getBooks();
  Future<Result<BookDetailModel, AppException>> getBookDetail(int id);
}
