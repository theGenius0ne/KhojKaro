import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khojkaro/services/PostCrud.dart';
import 'package:khojkaro/views/LoginScreen.dart';

import '../main.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _success = false;
  String id, name, number, email, password;
  FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference reference =
      FirebaseFirestore.instance.collection('/Users');

  uplodeUserDetails() async {
    try {
      Map<String, String> userMap = {
        "userId": id,
        "userName": name,
        "userNumber": number,
        "userEmail": email,
        "userPassword": password
      };
      await reference.doc(id).set(userMap).whenComplete(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNavBar()));
      });
    } catch (onError) {
      print("Error");
    }
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
              "Register",
              style: TextStyle(color: Color(0xff6739B7), fontSize: 30),
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
                    name = "" + val;
                  });
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      IconData(57360, fontFamily: 'MaterialIcons'),
                      color: Color(0xff6739B7),
                    ),
                    border: InputBorder.none,
                    hintText: 'Name'),
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
                    number = "" + val;
                  });
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      IconData(57534, fontFamily: 'MaterialIcons'),
                      color: Color(0xff6739B7),
                    ),
                    border: InputBorder.none,
                    hintText: 'Number'),
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
                    email = "" + val;
                  });
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      IconData(57534, fontFamily: 'MaterialIcons'),
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
                  _auth
                      .createUserWithEmailAndPassword(
                          email: email, password: password)
                      .whenComplete(() {
                    final User user = _auth.currentUser;
                    id = user.uid;
                    uplodeUserDetails();
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xff6739B7),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    "Register",
                    style: TextStyle(color: Color(0xffFFD700)),
                  )),
                )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Already have an Account? Click here"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
