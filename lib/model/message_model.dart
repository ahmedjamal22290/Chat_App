import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String text;
  final String email;
  final Timestamp time;
  String? id;
  MessageModel(
      {required this.text, required this.email, required this.time, this.id});

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
        text: jsonData['message'],
        email: jsonData['id'],
        time: jsonData['date'],
        id: (jsonData['date'] as Timestamp).toString());
  }
}
