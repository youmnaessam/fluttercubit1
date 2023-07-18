import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  String label;
  MyButton({super.key, required this.label});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          widget.label,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
