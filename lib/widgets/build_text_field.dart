import 'package:flutter/material.dart';

bool isObscurePassword = true;

Widget buildTextField (
    String label, String placeHolder, bool isPasswordTextField) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: TextField(
      obscureText: isPasswordTextField ? isObscurePassword : false,
      decoration: InputDecoration(
        suffixIcon: isPasswordTextField
            ? IconButton(
                onPressed: () {
                  isObscurePassword = !isObscurePassword;
                },
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ))
            : null,
        contentPadding: const EdgeInsets.only(bottom: 5),
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeHolder,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),

    ),
  );
}
