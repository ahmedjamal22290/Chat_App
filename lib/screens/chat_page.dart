import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/constants.dart';
import 'package:k/cubit/chat_cubit/chat_cubit.dart';
import 'package:k/cubit/dark_mode_cubit/dark_mode_cubit.dart';
import 'package:k/model/message_model.dart';
import 'package:k/widgets/message_box.dart';

class ChatPage extends StatefulWidget {
  static String id = 'chatPage';

  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  late var email;
  List<MessageModel> messageList = [];
  late AnimationController _animationController;
  late Animation<Offset> _animatePos;

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<ChatCubit>(context).getMessages();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    _animatePos = Tween<Offset>(
      begin: const Offset(-21, 0),
      end: const Offset(21, 0),
    ).animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              if (BlocProvider.of<ModeCubit>(context).dark) {
                _animationController.reverse();
                BlocProvider.of<ModeCubit>(context).dark = false;
              } else {
                _animationController.forward();
                BlocProvider.of<ModeCubit>(context).dark = true;
              }
              BlocProvider.of<ModeCubit>(context).darkMode();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              width: 80,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.black54,
              ),
              child: AnimatedBuilder(
                animation: _animatePos,
                builder: (context, child) {
                  return Transform.translate(
                    offset: _animatePos.value,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        !BlocProvider.of<ModeCubit>(context).dark
                            ? Icons.dark_mode
                            : Icons.sunny,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
                child: Container(),
              ),
            ),
          )
        ],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 3,
            ),
            Image(
              image: AssetImage('assets/images/scholar.png'),
              height: 60,
            ),
            Text(
              'Chat',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontFamily: 'pacifico',
              ),
            ),
            Spacer()
          ],
        ),
        backgroundColor: BlocProvider.of<ModeCubit>(context).dark
            ? const Color.fromARGB(255, 10, 65, 60)
            : kPrimaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSucess) messageList = state.messageList;
              },
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  controller: _scrollController,
                  itemCount: messageList.length,
                  itemBuilder: (context, index) {
                    if (email.toString() == messageList[index].email) {
                      return MessageBoxUser1(
                        id: messageList[index].id,
                        time: messageList[index].time.toDate(),
                        message: messageList[index].text,
                      );
                    } else {
                      return MessageBoxUser2(
                        time: messageList[index].time.toDate(),
                        message: messageList[index].text,
                      );
                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _controller,
              onSubmitted: (value) {
                BlocProvider.of<ChatCubit>(context)
                    .sennMessage(message: value, email: email);
                _scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn);
                _controller.clear();
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: GestureDetector(
                  onTap: () {
                    BlocProvider.of<ChatCubit>(context)
                        .sennMessage(message: _controller.text, email: email);
                    _scrollController.animateTo(0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn);
                    _controller.clear();
                  },
                  child: const Icon(
                    size: 30,
                    Icons.send,
                    color: Color(0xFF0B6960),
                  ),
                ),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF0B6960),
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.black,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> addMessage(String value) {
  //   return message
  //       .add({
  //         'message': value,
  //         'date': DateTime.now(),
  //         'id': email,
  //       })
  //       .then((value) => log('then'))
  //       .catchError((error) => log("Failed to add message: $error"));
  // }
}

// StreamBuilder<QuerySnapshot>(
//             stream: message.orderBy('date', descending: true).snapshots(),
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasError) {
//                 log('error');
//                 return const Text('There was an error');
//               }
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 log('Wating');
//                 return const Padding(
//                   padding: EdgeInsets.all(120.0),
//                   child: CupertinoActivityIndicator(
//                     radius: 20,
//                   ),
//                 );
//               } else if (snapshot.hasData) {
//                 List<MessageModel> messageList = [];
//                 for (int i = 0; i < snapshot.data!.docs.length; i++) {
//                   messageList
//                       .add(MessageModel.fromJson(snapshot.data!.docs[i]));
//                   messageList[messageList.length - 1].id =
//                       snapshot.data!.docs[i].id;
//                 }
//                 // return Text('snapshot');
//                 return Expanded(
//                   child: ListView.builder(
//                     reverse: true,
//                     controller: _scrollController,
//                     itemCount: messageList.length,
//                     itemBuilder: (context, index) {
//                       if (email.toString() == messageList[index].email) {
//                         return MessageBoxUser1(
//                           id: messageList[index].id!,
//                           time: messageList[index].time.toDate(),
//                           message: messageList[index].text,
//                         );
//                       } else {
//                         return MessageBoxUser2(
//                           time: messageList[index].time.toDate(),
//                           message: messageList[index].text,
//                         );
//                       }
//                     },
//                   ),
//                 );
//               } else {
//                 return const Text('data');
//               }
//             },
//           ),