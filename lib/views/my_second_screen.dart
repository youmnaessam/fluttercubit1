import 'package:flutter/material.dart';
import 'package:flutter_app1/views/bottom_sheet_pages/main_screen.dart';
import 'package:flutter_app1/views/bottom_sheet_pages/profile_screen.dart';
import 'package:flutter_app1/views/bottom_sheet_pages/settings_screen.dart';

class SecondPage extends StatefulWidget {
  String email;
  SecondPage({
    super.key,
    required this.email,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int selectedIndex = 0;
  List<Widget> page = [
    MainScreen(),
    ProfileScreen(
      email: '-',
    ),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Screen"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: page[selectedIndex], //page[selectedIndex],
      /* Column(
        children: [
          Text(widget.email),
        ],
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        onTap: (pageIndex) {
          selectedIndex = pageIndex;
          setState(() {});
        },
      ),
    );
  }
}
