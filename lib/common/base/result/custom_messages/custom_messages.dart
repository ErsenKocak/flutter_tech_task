import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_messages.freezed.dart';
part 'custom_messages.g.dart';

@freezed
class CustomMessages with _$CustomMessages {
  factory CustomMessages({
    String? navigationUrl,
  }) = _CustomMessages;

  factory CustomMessages.fromJson(Map<String, dynamic> json) =>
      _$CustomMessagesFromJson(json);
}
