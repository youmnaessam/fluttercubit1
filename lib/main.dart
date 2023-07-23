import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/firebase_options.dart';
import 'package:flutter_app1/views/cars_list.dart';
import 'package:flutter_app1/views/widget/mybutton.dart';
import 'package:flutter_app1/views/my_second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app1/views/widget/mylogo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future <void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}

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
        //useMaterial3: true,
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
    final TextEditingController emailController = TextEditingController(text:"");
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Home Screen"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
              LogoWidget(),
              /*Container(
                width: 200,
                height: 250,
                child: Image.asset("assets/Flutter.png"),
              ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(label: Text("Email")),
                  controller: emailController,
                  /*onChanged: (value){
                          var email = value;
                        },*/
                 // onFieldSubmitted: (value) {
                  //  print(value);
                  //},
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
              /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondPage(
                                email: emailController.text,
                              )
                            ),
                    );*/
              InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                  bool loginResult = await signinUsingFirebase(emailController.text, passwordController.text); 
                  if(loginResult == true){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  CarsList()),
                       );
                     }else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login faild")));
                     }
                  }else{
                    emailController.clear();
                  }
                },
                child: MyButton(
                  label: "login",
                   textColor: Colors.yellow,
                   bgColor: Colors.blue, text: '',
                ),
              ),
               MyButton(
                  label: "SignUp",
                  textColor: Colors.green,
                  bgColor: Colors.brown, text: '',
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

  Future<bool> signinUsingFirebase(String email, String password) async {
    bool result = false;
    try{
      UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;
    if(user != null){
      print(user?.uid);
      saveEmail(user!.email!);
      result = true;
    }
    return result;
    }catch(e){
      return result;
    }
  }

}
