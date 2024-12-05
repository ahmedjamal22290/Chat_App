import 'package:flutter/material.dart';
import 'package:k/constants.dart';
import 'package:k/widgets/message_box.dart';

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
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return index % 2 == 0
                ? messageBoxUser1(message: 'message1')
                : messageBoxUser2(message: 'message2');
          },
        ),
      ),
    );
  }
}
