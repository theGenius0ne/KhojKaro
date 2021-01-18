import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:khojkaro/views/AccountScreen.dart';
import 'package:khojkaro/views/DistributerScreen.dart';
import 'package:khojkaro/views/GeneralScreen.dart';
import 'package:khojkaro/views/HomeScreen.dart';
import 'package:khojkaro/views/LoginScreen.dart';
import 'package:khojkaro/views/MessageScreen.dart';
import 'package:khojkaro/views/ReferScreen.dart';
import 'package:khojkaro/views/RetailerScreen.dart';
import 'package:khojkaro/views/VideoScreen.dart';
import 'package:khojkaro/views/WholesalerScreen.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image.asset(
            'assets/images/logo.png',
            height: 130,
            width: 130,
          ),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  static const String _AccountName = 'KhojKare';
  static const String _AccountEmail = 'info@khojkare.com';
  static const String _AccountAbbr = 'KK';
  FirebaseAuth _firebaseAuth;

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    VideoScreen(),
    MessageScreen(),
    ReferScreen(),
    AccountScreen()
  ];

  Void NavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _launchGmail(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  logOutUser() async {
    _firebaseAuth = FirebaseAuth.instance;
    await _firebaseAuth.signOut().whenComplete(() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KhojKare", style: TextStyle(color: Color(0xffFFD700))),
        backgroundColor: Color(0xff6739B7),
        iconTheme: IconThemeData(color: Color(0xffFFD700)),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(IconData(62063, fontFamily: 'MaterialIcons'),
                  size: 26.0, color: Color(0xffFFD700)),
            ),
          ),
        ],
      ),
      body: _children[_currentIndex],
      drawer: Drawer(
          child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xff6739B7),
          ),
          accountName: const Text(
            _AccountName,
            style: TextStyle(color: Color(0xffFFD700)),
          ),
          accountEmail: const Text(
            _AccountEmail,
            style: TextStyle(color: Color(0xffFFD700)),
          ),
          currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text(
                _AccountAbbr,
                style: TextStyle(color: Color(0xff6739B7)),
              )),
        ),
        ListTile(
            leading: Icon(IconData(57958, fontFamily: 'MaterialIcons')),
            title: Text('Language'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountScreen()));
            }),
        ListTile(
          leading: Icon(
            IconData(62069, fontFamily: 'MaterialIcons'),
          ),
          title: Text('About Us'),
          onTap: null,
        ),
        ListTile(
          leading: Icon(
            IconData(57360, fontFamily: 'MaterialIcons'),
          ),
          title: Text('Contact Us'),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.mail_outline),
          title: Text('Feedback'),
          onTap: () => _launchGmail("info@khojkare.com",
              "Feedback for KhojKare App.", "Type Feedback here!"),
        ),
        ListTile(
          leading: Icon(
            IconData(57642, fontFamily: 'MaterialIcons'),
          ),
          title: Text('Delete Account Permently'),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text('Advertisement'),
          onTap: null,
        ),
        ListTile(
          leading: Icon(
            IconData(59464, fontFamily: 'MaterialIcons'),
          ),
          title: Text('Log out'),
          onTap: () => logOutUser(),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => launch(
                  "https://www.websolguru.com/?utm_source=Khojkare&utm_medium=app&utm_campaign=khojkare_app&utm_term=khojkare%2Capp&utm_content=navigation_drawer"),
              child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Developed By WebSolGuru',
                    style: TextStyle(
                        color: Color(0xff6739B7), fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ),
      ])),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xffFFD700),
          unselectedItemColor: Colors.white,
          backgroundColor: Color(0xff6739B7),
          currentIndex: _currentIndex,
          onTap: NavItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(
                  IconData(57898, fontFamily: 'MaterialIcons'),
                ),
                // ignore: deprecated_member_use
                activeIcon: Icon(
                  IconData(59323, fontFamily: 'MaterialIcons'),
                ),
                // ignore: deprecated_member_use
                title: Text('Home')),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(Icons.play_circle_outline),
                activeIcon: Icon(Icons.play_circle_filled),
                // ignore: deprecated_member_use
                title: Text('Videos')),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(
                  IconData(58038, fontFamily: 'MaterialIcons'),
                ),
                activeIcon: Icon(Icons.mail),
                // ignore: deprecated_member_use
                title: Text('Message')),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(
                  IconData(58386, fontFamily: 'MaterialIcons'),
                ),
                activeIcon: Icon(Icons.share),
                // ignore: deprecated_member_use
                title: Text('Refer')),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(
                  IconData(57360, fontFamily: 'MaterialIcons'),
                ),
                activeIcon: Icon(Icons.account_circle),
                // ignore: deprecated_member_use
                title: Text('Profile')),
          ]),
    );
  }
}
