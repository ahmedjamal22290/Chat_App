import 'package:flutter/material.dart';
import 'package:k/constants.dart';

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
        margin: EdgeInsets.only(left: 30, right: 2, bottom: 5, top: 10),
        padding: EdgeInsets.only(left: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              topLeft: Radius.circular(12)),
          color: kChatSecondColor,
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
        margin: EdgeInsets.only(right: 30, left: 2, bottom: 5, top: 10),
        padding: EdgeInsets.only(left: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topLeft: Radius.circular(12)),
          color: kChatFirstColor,
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
