import 'package:flutter_tech_task/common/base/result/base_result.dart';
import 'package:flutter_tech_task/common/base/result/exception.dart';
import 'package:flutter_tech_task/core/constants/network/http_call_type/http_call_type.dart';
import 'package:flutter_tech_task/core/mapper/api_model_mapper.dart';
import 'package:flutter_tech_task/core/network/http_client/http_client_api_url/http_client_end_points.dart';
import 'package:flutter_tech_task/core/network/http_client/manager/network_client.dart';
import 'package:flutter_tech_task/features/home/data/models/response/book_model/book_model.dart';
import 'package:flutter_tech_task/features/home/data/services/i_book_service.dart';

/// final yapılmasının nedeni ise bu classtan başka bir class'ın kalıtım almasını engellemektir.
/// final yaparak Flutter'a başka bir class'ın kalıtım almayacağını taahhüt ederiz.
/// final property'ler gibi tek nesne özelliği taşıdığından performans artışıda sağlamaktadır.
final class BookService implements IBookService {
  final NetworkClient _networkClient;

  /// Dependency Injection(Constructor Injection)
  /// Birden fazla API ile çalışılan projelerde Service ve Repository katmanında yapıldığı gibi
  /// Network Client için Interface kullanarak Abstraction kullanılmaktadır.
  BookService(this._networkClient);

  @override
  Future<Result<List<BookModel>, AppException>> getBooks() async {
    return await _networkClient.call(
      path: HttpClientEndPoints.GetBooks.URL,
      callType: HttpCallType.GET,
      mapper: (json) =>
          APIModelMapper.jsonToList<BookModel>(json, BookModel.fromJson),
    );
  }

  @override
  Future<Result<BookModel, AppException>> getBookDetail(int id) async {
    return await _networkClient.call(
      path: '${HttpClientEndPoints.GetBookDetail.URL}/$id',
      callType: HttpCallType.GET,
      mapper: (json) => BookModel.fromJson(json),
    );
  }
}
