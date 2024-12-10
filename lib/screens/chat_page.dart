import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:k/constants.dart';
import 'package:k/model/message_model.dart';
import 'package:k/widgets/message_box.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class chatPage extends StatelessWidget {
  static String id = 'chatPage';
  late var email;
  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  final Stream<QuerySnapshot> _messageStream =
      FirebaseFirestore.instance.collection(kMessagesCollection).snapshots();
  final ScrollController _scrollController = ScrollController();
  TextEditingController _controller = TextEditingController();
  Widget build(BuildContext context) {
    email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          ],
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: message.orderBy('date', descending: true).snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                log('error');
                return Text('There was an error');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                log('Wating');
                return Padding(
                  padding: const EdgeInsets.all(120.0),
                  child: CupertinoActivityIndicator(
                    radius: 20,
                  ),
                );
              } else if (snapshot.hasData) {
                List<messageModel> messageList = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  messageList
                      .add(messageModel.fromJson(snapshot.data!.docs[i]));
                }
                // return Text('snapshot');
                return Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      if (email.toString() == messageList[index].email) {
                        return messageBoxUser1(
                          time: messageList[index].time.toDate(),
                          message: messageList[index].text,
                        );
                      } else {
                        return messageBoxUser2(
                          time: messageList[index].time.toDate(),
                          message: messageList[index].text,
                        );
                      }
                    },
                  ),
                );
              } else {
                return Text('data');
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _controller,
              onSubmitted: (value) {
                addMessage(value);
                _scrollController.animateTo(0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn);
                _controller.clear();
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: GestureDetector(
                  onTap: () {
                    addMessage(_controller.text);
                    _scrollController.animateTo(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn);
                    _controller.clear();
                  },
                  child: Icon(
                    size: 30,
                    Icons.send,
                    color: const Color(0xFF0B6960),
                  ),
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(
                      width: 2,
                      color: const Color(0xFF0B6960),
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
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

  Future<void> addMessage(String value) {
    return message
        .add({
          'message': value,
          'date': DateTime.now(),
          'id': email,
        })
        .then((value) => log('then'))
        .catchError((error) => log("Failed to add message: $error"));
  }
}
