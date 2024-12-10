class messageModel {
  final String text;
  final String email;
  messageModel({required this.text, required this.email});

  factory messageModel.fromJson(jsonData) {
    return messageModel(text: jsonData['message'], email: jsonData['id']);
  }
}
