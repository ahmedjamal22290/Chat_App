import 'package:flutter/material.dart';

class customTextFromField extends StatelessWidget {
  customTextFromField(
      {super.key,
      required this.onChanged,
      required this.labelText,
      this.scure,
      this.SuffixIcon = false,
      this.onTap});
  String? labelText;
  bool? scure = false;
  bool SuffixIcon;
  VoidCallback? onTap;
  Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: scure ?? false,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return "field is empty";
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: SuffixIcon
            ? GestureDetector(
                onTap: onTap ?? () {},
                child: Icon(
                  Icons.remove_red_eye,
                  size: 23,
                ),
              )
            : null,
        errorStyle: TextStyle(
            color: const Color.fromARGB(255, 156, 11, 0),
            fontWeight: FontWeight.bold),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(0xFFFF0000),
              width: 1.5,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: const Color(0xFF1E3D73),
              width: 1.5,
            )),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
          width: 1.5,
        )),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
    );
  }
}
