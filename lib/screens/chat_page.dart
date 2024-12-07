import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:k/constants.dart';
import 'package:k/widgets/message_box.dart';

class chatPage extends StatelessWidget {
  static String id = 'chatPage';
  CollectionReference message =
      FirebaseFirestore.instance.collection('messages');
  Widget build(BuildContext context) {
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
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return index % 2 == 0
                    ? messageBoxUser1(message: 'message1')
                    : messageBoxUser2(message: 'message2');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onSubmitted: (value) {
                addMessage(value);
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: Icon(
                  size: 30,
                  Icons.send,
                  color: const Color(0xFF0B6960),
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
        .add({'message': value})
        .then((value) => log('thennn'))
        .catchError((error) => log("Failed to add user: $error"));
  }
}
