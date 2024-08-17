import 'custom_messages/mock_custom_messages.dart';

class MockAppException implements Exception {
  final String message;
  final MockCustomMessages? customMessages;

  MockAppException(this.message, {this.customMessages});
}
