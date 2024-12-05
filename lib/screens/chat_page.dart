import 'package:flutter/material.dart';
import 'package:k/constants.dart';

class chatPage extends StatelessWidget {
  static String id = 'chatPage';
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView(
          children: [
            messageBoxUser1(
              message: "Ahmed Jamal AbdEl-Zaher",
            ),
            messageBoxUser2(
              message: "Ahmed Jamal El-Rozany",
            ),
            messageBoxUser2(
              message: "Ahmed Jamal El-Rozany",
            ),
            messageBoxUser1(
              message: "Ahmed Jamal AbdEl-Zaher",
            ),
            messageBoxUser2(
              message: "Ahmed Jamal El-Rozany",
            ),
          ],
        ),
      ),
    );
  }
}

class messageBoxUser2 extends StatelessWidget {
  messageBoxUser2({super.key, required this.message});
  String message;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 70,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 45, right: 2, bottom: 10),
        padding: EdgeInsets.only(left: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              topLeft: Radius.circular(12)),
          color: KChatSecondColor,
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.start,
            message,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class messageBoxUser1 extends StatelessWidget {
  messageBoxUser1({super.key, required this.message});
  String message;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 70,
      ),
      child: Container(
        margin: EdgeInsets.only(right: 45, left: 2, bottom: 10),
        padding: EdgeInsets.only(left: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topLeft: Radius.circular(12)),
          color: KChatFirstColor,
        ),
        child: Center(
          child: Text(
            message,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
