import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                        height: 80,
                        width: 80,
                        child: new CircleAvatar(
                          backgroundColor: Color(0xff6739B7),
                          child: Container(
                            child: Icon(
                              IconData(57360, fontFamily: 'MaterialIcons'),
                              color: Color(0xffFFD700),
                              size: 40,
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Pranav Jadhav",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Text(
                    "No Posts",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  IconData(57368, fontFamily: 'MaterialIcons'),
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Add",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Posts",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          color: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  IconData(58491, fontFamily: 'MaterialIcons'),
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Edit",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Profile",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          color: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  IconData(57360, fontFamily: 'MaterialIcons'),
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Add Profile",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Photo",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black45,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
