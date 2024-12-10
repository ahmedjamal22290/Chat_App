import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:k/constants.dart';
import 'package:k/screens/chat_page.dart';

class messageBoxUser2 extends StatelessWidget {
  messageBoxUser2({super.key, required this.message, required this.time});
  String message;
  DateTime time;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 70,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 2, bottom: 5, top: 10),
        padding: EdgeInsets.only(left: 6),
        decoration: BoxDecoration(
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
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            Text(
              '${time.hour.toString()}:${time.minute.toString()}',
              style: TextStyle(color: const Color.fromARGB(181, 0, 0, 0)),
            ),
          ],
        ),
      ),
    );
  }
}

class messageBoxUser1 extends StatelessWidget {
  messageBoxUser1(
      {super.key, required this.message, required this.time, required this.id});
  String message;
  DateTime time;
  String id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        showMenu(
            elevation: 150,
            context: context,
            position: RelativeRect.fromLTRB(150, 650, 150, 150),
            items: [
              PopupMenuItem(
                value: "delete",
                child: Text('Delete'),
              ),
              PopupMenuItem(
                value: "Cancle",
                child: Text('Cancle'),
              ),
            ]).then((onValue) async {
          if (onValue == 'delete') {
            await deleteUser(id);
          }
        });
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 70,
        ),
        child: Container(
          margin: EdgeInsets.only(right: 30, left: 2, bottom: 5, top: 10),
          padding: EdgeInsets.only(left: 6),
          decoration: BoxDecoration(
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
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              Text(
                '${time.hour.toString()}:${time.minute.toString()}',
                style: TextStyle(color: const Color.fromARGB(181, 0, 0, 0)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> deleteUser(String id) {
    return FirebaseFirestore.instance
        .collection(kMessagesCollection)
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
