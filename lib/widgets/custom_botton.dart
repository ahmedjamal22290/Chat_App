import 'package:flutter/material.dart';

class customBotton extends StatelessWidget {
  customBotton({
    required this.onTap,
    required this.title,
    super.key,
  });
  VoidCallback onTap;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 25.0, left: 10, right: 5, bottom: 5),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Pacifico',
            ),
          )),
        ),
      ),
    );
  }
}
