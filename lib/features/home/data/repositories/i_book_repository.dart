import 'package:flutter_tech_task/common/base/result/base_result.dart';
import 'package:flutter_tech_task/common/base/result/exception.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';

abstract class IBookRepository {
  Future<Result<List<BookEntity>, AppException>> getBooks();
  Future<Result<BookEntity, AppException>> getBookDetail(int id);
}
