import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:k/constants.dart';
import 'package:k/model/message_model.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  void sennMessage({required String message, required String email}) {
    messages.add({
      'message': message,
      'date': DateTime.now(),
      'id': email,
    });
  }

  void getMessages() {
    messages.orderBy('date', descending: true).snapshots().listen((event) {
      List<MessageModel> messageList = [];
      for (var doc in event.docs) {
        messageList.add(MessageModel.fromJson(doc));
      }
      emit(ChatSucess(messageList: messageList));
    });
  }
}
