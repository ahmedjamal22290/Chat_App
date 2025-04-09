import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    required this.onTap,
    required this.title,
    super.key,
  });
  final VoidCallback onTap;
  final String title;
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
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: 'Pacifico',
            ),
          )),
        ),
      ),
    );
  }
}
