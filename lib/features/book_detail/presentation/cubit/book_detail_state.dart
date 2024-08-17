part of 'book_detail_cubit.dart';

@freezed
class BookDetailState with _$BookDetailState implements BaseState {
  const factory BookDetailState.initial() = _Initial;
  const factory BookDetailState.loading() = _Loading;
  const factory BookDetailState.success(final BookEntity bookDetail) = _Success;
  const factory BookDetailState.failure(final AppException exception) =
      _Failure;
}
