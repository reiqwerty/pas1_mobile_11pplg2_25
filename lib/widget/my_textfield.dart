import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final IconData? icon;

  const MyTextField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.icon,
  }) : super(key: key);

  @override
  MyTextFieldState createState() => MyTextFieldState();
}

class MyTextFieldState extends State<MyTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword && !isPasswordVisible,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: widget.icon != null ? Icon(widget.icon, color: Colors.grey) : null,
          suffixIcon: widget.isPassword ? IconButton(icon: Icon( isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          ) : null,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
        ),
      ),
    );
  }
}