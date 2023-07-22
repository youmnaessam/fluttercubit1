import 'package:flutter/material.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget({super.key});

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
                width: 200,
                height: 250,
                child: Image.asset("assets/Flutter.png"),
              );
  }
}
