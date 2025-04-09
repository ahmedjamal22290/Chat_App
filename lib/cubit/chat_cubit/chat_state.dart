part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatSucess extends ChatState {
  ChatSucess({required this.messageList});
  List<MessageModel> messageList;
}
