import 'package:bloc/bloc.dart';
import 'package:flutter_tech_task/common/base/cubit/base_cubit.dart';
import 'package:flutter_tech_task/common/base/cubit/base_state.dart';
import 'package:flutter_tech_task/common/base/result/base_result.dart';
import 'package:flutter_tech_task/common/base/result/exception.dart';
import 'package:flutter_tech_task/features/home/domain/entities/response/book_entity/book_entity.dart';
import 'package:flutter_tech_task/features/home/data/repositories/i_book_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_detail_state.dart';
part 'book_detail_cubit.freezed.dart';

class BookDetailCubit extends Cubit<BookDetailState> with BaseCubit {
  BookDetailCubit(this._bookRepository) : super(BookDetailState.initial());

  final IBookRepository _bookRepository;
  late BookEntity? bookDetailEntity;

  @override
  Future<void> initialize() async {}

  Future<void> getBookDetail(int id) async {
    safeEmit(BookDetailState.loading());

    final response = await _bookRepository.getBookDetail(id);

    final value = switch (response) {
      Success(value: BookEntity _bookDetail) => {
          bookDetailEntity = _bookDetail,
          safeEmit(BookDetailState.success(bookDetailEntity!)),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(BookDetailState.failure(exception)),
          showErrorBottomSheet(exceptionMessage: exception.message),
        },
    };
  }
}
