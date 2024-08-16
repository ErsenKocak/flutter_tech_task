part of 'notification_cubit.dart';

@Freezed(equal: false)
class NotificationState with _$NotificationState implements BaseState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = _Loading;
  const factory NotificationState.success(
      List<NotificationEntity> notifications) = _Success;
  const factory NotificationState.failure(final String errorMessage) = _Failure;
}
