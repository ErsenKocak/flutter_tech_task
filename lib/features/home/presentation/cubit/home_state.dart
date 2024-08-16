part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState implements BaseState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;

  /// İlgili veriyi Cubitte global tutmak ile birlikte state içerisinde de taşıyabiliriz.
  /// Bu state'e eriştiğimizde taşıdığımız bu veriye de erişebiliriz.
  const factory HomeState.listSuccess(final List<BookEntity> bookList) =
      _ListSuccess;
  const factory HomeState.failure(final AppException exception) = _Failure;
}
