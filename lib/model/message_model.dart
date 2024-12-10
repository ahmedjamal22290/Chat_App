import 'package:cloud_firestore/cloud_firestore.dart';

class messageModel {
  final String text;
  final String email;
  final Timestamp time;
  messageModel({required this.text, required this.email, required this.time});

  factory messageModel.fromJson(jsonData) {
    return messageModel(
        text: jsonData['message'],
        email: jsonData['id'],
        time: jsonData['date']);
  }
}
