import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String subject, message;

  _launchGmail(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Image.asset(
              'assets/images/message.png',
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 1,
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff6739B7)),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      subject = value;
                    });
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Enter Subject...'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0, right: 20, left: 20),
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff6739B7)),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: TextField(
                  onChanged: (valuee) {
                    setState(() {
                      message = valuee;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Message...',
                  ),
                  maxLines: 5,
                  maxLength: 500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                // height : 50.0,
                  color: Color(0xff6739B7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () =>
                      _launchGmail("info@khojkare.com", subject, message),
                  child: Container(
                    height: 50.0,
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Color(0xffFFD700)),
                    ),
                  ),),
            )
          ],
        ),
      ),
    );
  }
}
