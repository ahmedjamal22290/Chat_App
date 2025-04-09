import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k/constants.dart';
import 'package:k/cubit/chat_cubit/chat_cubit.dart';

class MessageBoxUser2 extends StatelessWidget {
  const MessageBoxUser2({super.key, required this.message, required this.time});
  final String message;
  final DateTime time;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 70,
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 2, bottom: 5, top: 10),
        padding: const EdgeInsets.only(left: 6),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              topLeft: Radius.circular(12)),
          color: kChatSecondColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text(
                textAlign: TextAlign.start,
                message,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            Text(
              '${time.hour.toString()}:${time.minute.toString()}',
              style: const TextStyle(color: Color.fromARGB(181, 0, 0, 0)),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBoxUser1 extends StatelessWidget {
  const MessageBoxUser1(
      {super.key, required this.message, required this.time, this.id});
  final String message;
  final DateTime time;
  final String? id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        showMenu(
            elevation: 150,
            context: context,
            position: const RelativeRect.fromLTRB(150, 650, 150, 150),
            items: [
              const PopupMenuItem(
                value: "delete",
                child: Text('Delete'),
              ),
              const PopupMenuItem(
                value: "Cancle",
                child: Text('Cancle'),
              ),
            ]).then((onValue) async {
          if (onValue == 'delete') {
            await deleteUser(id ?? time.toString(), context);
          }
        });
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 70,
        ),
        child: Container(
          margin: const EdgeInsets.only(right: 30, left: 2, bottom: 5, top: 10),
          padding: const EdgeInsets.only(left: 6),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topLeft: Radius.circular(12)),
            color: kChatFirstColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              Text(
                '${time.hour.toString()}:${time.minute.toString()}',
                style: const TextStyle(color: Color.fromARGB(181, 0, 0, 0)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> deleteUser(String id, BuildContext context) {
    return FirebaseFirestore.instance
        .collection(kMessagesCollection)
        .doc(id)
        .delete()
        .then((value) {
      log("message Deleted");
      BlocProvider.of<ChatCubit>(context).getMessages();
    }).catchError((error) => log("Failed to delete massage: $error"));
  }
}
