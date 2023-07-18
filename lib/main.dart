import 'package:flutter/material.dart';
import 'package:flutter_app1/views/widget/mybutton.dart';
import 'package:flutter_app1/views/my_second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  //const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    //TextEditingController _controller =new TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Home Screen"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(children: [
              Container(
                width: 200,
                height: 250,
                child: Image.asset("assets/Flutter.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(label: Text("Email")),
                  controller: emailController,
                  /*onChanged: (value){
                          var email = value;
                        },*/
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  validator: (value) {
                    if (value!.contains("@") && value!.length > 5) {
                      return null;
                    } else {
                      return "Not valid email";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(label: Text("Password")),
                  validator: (value) {
                    if (value!.length < 8) {
                      return "passord should contain 9 characters or more";
                    }
                  },
                ),
              ),
              //SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    saveEmail(emailController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondPage(
                                email: emailController.text,
                              )),
                    );
                  }
                },
                child: MyButton(
                  label: "login",
                ),
              ),

              TextButton(
                style: TextButton.styleFrom(
                    textStyle:
                        const TextStyle(fontSize: 15, color: Colors.black),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                onPressed: () {},
                child: const Text('Forget password?No yawa.Tap me'),
              ),
            ]),
          ),
        ));
  }

  saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }
}
