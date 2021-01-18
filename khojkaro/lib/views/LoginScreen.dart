import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khojkaro/main.dart';
import 'package:khojkaro/views/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _success = false;
  String email, password;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNavBar()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              "Login",
              style: TextStyle(color: Color(0xff6739B7), fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, right: 20, left: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xff6739B7)),
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.only(left: 2, right: 10),
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    email = "" + val;
                  });
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      IconData(57715, fontFamily: 'MaterialIcons'),
                      color: Color(0xff6739B7),
                    ),
                    border: InputBorder.none,
                    hintText: 'Email'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, right: 20, left: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xff6739B7)),
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.only(left: 2, right: 10),
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    password = "" + val;
                  });
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      IconData(62171, fontFamily: 'MaterialIcons'),
                      color: Color(0xff6739B7),
                    ),
                    border: InputBorder.none,
                    hintText: 'Password'),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 20.0),
            child: FlatButton(
                onPressed: () {
                  _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BottomNavBar()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xff6739B7),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text("Login",
                          style: TextStyle(color: Color(0xffFFD700)))),
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Don't have an Account yet? Click here"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
