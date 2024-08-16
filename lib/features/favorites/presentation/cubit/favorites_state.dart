part of 'favorites_cubit.dart';

@Freezed(equal: false)
class FavoritesState with _$FavoritesState implements BaseState {
  const factory FavoritesState.initial() = _Initial;
  const factory FavoritesState.loading() = _Loading;
  const factory FavoritesState.success(final List<BookEntity> favoriteBooks) =
      _Success;
  const factory FavoritesState.failure(final String errorMessage) = _Failure;
}
