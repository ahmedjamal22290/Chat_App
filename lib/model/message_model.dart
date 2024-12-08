import 'package:k/constants.dart';

class messageModel {
  final String text;

  messageModel({required this.text});

  factory messageModel.fromJson(jsonData) {
    return messageModel(text: jsonData['message']);
  }
}
