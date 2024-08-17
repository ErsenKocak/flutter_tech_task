import 'package:freezed_annotation/freezed_annotation.dart';

part 'mock_custom_messages.freezed.dart';
part 'mock_custom_messages.g.dart';

@freezed
class MockCustomMessages with _$MockCustomMessages {
  factory MockCustomMessages({
    String? navigationUrl,
  }) = _MockCustomMessages;

  factory MockCustomMessages.fromJson(Map<String, dynamic> json) =>
      _$MockCustomMessagesFromJson(json);
}
