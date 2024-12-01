import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  customTextField({super.key, required this.labelText});
  String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color(0xFF1E3D73),
              width: 1.5,
            )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
          width: 1.5,
        )),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
    );
  }
}
