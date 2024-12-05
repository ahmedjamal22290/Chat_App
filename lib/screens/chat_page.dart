import 'package:flutter/material.dart';
import 'package:k/constants.dart';

class chatPage extends StatelessWidget {
  static String id = 'chatPage';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Spacer(),
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
          Spacer(),
        ],
        backgroundColor: kPrimaryColor,
      ),
      bottomNavigationBar: Text(
        'data',
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
