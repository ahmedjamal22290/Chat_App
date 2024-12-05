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
            ConstrainedBox(
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
                    'ahmed jamal abd El-Zaher',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            ConstrainedBox(
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
                    'ahmed jamal El-Rozany',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
