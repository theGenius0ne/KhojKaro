import 'package:flutter/material.dart';

class ReferScreen extends StatefulWidget {
  @override
  _ReferScreenState createState() => _ReferScreenState();
}

class _ReferScreenState extends State<ReferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/share.png',
            height: 300,
            width: MediaQuery.of(context).size.width / 1,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                // height: 40,
                color: Color(0xff6739B7),
                onPressed: () {},
                child: Container(
                  height: 40.0,
                  alignment: Alignment.center,
                  child: Text(
                    "Share KhojKare",
                    style: TextStyle(color: Color(0xffFFD700)),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
