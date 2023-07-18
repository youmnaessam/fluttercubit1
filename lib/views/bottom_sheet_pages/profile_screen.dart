import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app1/views/utils.dart';

class ProfileScreen extends StatefulWidget {
  String email;
  ProfileScreen({super.key, required this.email});

  @override
  State<ProfileScreen> createState() => _ProfileScreentState();
}

class _ProfileScreentState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    getEmail();
  }

  String userEmail = "";
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("userEmail"),
    );
  }

  getUserEmail() async {
    userEmail = await getEmail();
    setState(() {});
  }

  /*getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString("email") ?? "--";
    setState(() {});
  }*/
}
