import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khojkaro/services/PostCrud.dart';
import 'package:random_string/random_string.dart';

import '../main.dart';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  String serviceName, serviceDesc, whatsappNumber, callingNumber;
  File selectedImg;
  PostCrudMethods postCrudMethods = new PostCrudMethods();
  bool isUploding = false;

  static const List<Language> getLanguages = <Language>[
    Language(1, 'distributer'),
    Language(2, 'wholsaler'),
    Language(3, 'retailer'),
    Language(4, 'general services'),
  ];

  var _dropDownVal;

  Future getImage() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImg = image;
    });
  }

  uploadPost() {
    setState(() {
      isUploding = true;
    });
    Firebase.initializeApp();
    if (selectedImg != null) {
      Reference reference = FirebaseStorage.instance
          .ref()
          .child('PostImages')
          .child("${randomAlphaNumeric(9)}.jpg");

      final UploadTask task = reference.putFile(selectedImg);

      task.whenComplete(() async {
        try {
          var downloadURL = await reference.getDownloadURL();
          print(downloadURL);
          Map<String, String> postMap = {
            "imageUrl": downloadURL,
            "serviceName": serviceName,
            "serviceDesc": serviceDesc,
            "whatsappNumber": whatsappNumber,
            "callingNumber": callingNumber,
            "category": _dropDownVal
          };

          postCrudMethods.AddData(postMap).then((result) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BottomNavBar()));
          });
        } catch (onError) {
          print("Error");
        }
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Add Post",
            style: TextStyle(color: Color(0xffFFD700)),
          ),
          iconTheme: IconThemeData(color: Color(0xffFFD700)),
          backgroundColor: Color(0xff6739B7)),
      body: isUploding
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: selectedImg != null
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              height: 150,
                              width: 300,
                              child: Image.file(selectedImg, fit: BoxFit.cover),
                            )
                          : Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              height: 150,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Color(0xff6739B7),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                IconData(57364, fontFamily: 'MaterialIcons'),
                                color: Color(0xffFFD700),
                              ),
                            ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: <Widget>[
                          TextField(
                              decoration: InputDecoration(
                                  hintText: "Enter Service Name..."),
                              onChanged: (value) {
                                serviceName = value;
                              }),
                          SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                                hintText: "Enter Service Description..."),
                            onChanged: (value) {
                              serviceDesc = value;
                            },
                          ),
                          SizedBox(height: 8),
                          TextField(
                            maxLength: 10,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Enter WhatsApp Number..."),
                            onChanged: (value) {
                              whatsappNumber = value;
                            },
                          ),
                          SizedBox(height: 8),
                          TextField(
                            maxLength: 10,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Enter Calling Number..."),
                            onChanged: (value) {
                              callingNumber = value;
                            },
                          ),
                          DropdownButton(
                            isExpanded: true,
                            value: _dropDownVal,
                            hint: Text("Select Category"),
                            icon: Icon(
                              IconData(0xe052, fontFamily: 'MaterialIcons'),
                              color: Colors.black,
                            ),
                            items: getLanguages.map((Language lang) {
                              return new DropdownMenuItem<String>(
                                value: lang.name,
                                child: new Text(lang.name),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                _dropDownVal = "" + val;
                              });
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: FlatButton(
                                onPressed: () => uploadPost(),
                                child: Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Color(0xff6739B7),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(
                                        "Add Post",
                                        style: TextStyle(
                                            color: Color(0xffFFD700),
                                            fontSize: 18),
                                      ),
                                    ))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class Language {
  final int id;
  final String name;

  const Language(this.id, this.name);
}
