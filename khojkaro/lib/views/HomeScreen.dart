import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:khojkaro/services/PostCrud.dart';
import 'package:khojkaro/views/CategoryItem.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuerySnapshot postSnapshot;
  PostCrudMethods crudMethods = new PostCrudMethods();

  // categoryList() {
  //   return ListView(
  //     children: <Widget>[
  //       postSnapshot != null
  //           ? Column(
  //               children: <Widget>[
  //                 GridView.builder(
  //                   shrinkWrap: true,
  //                   // ignore: deprecated_member_use
  //                   itemCount: postSnapshot.documents.length,
  //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                     crossAxisCount: 3,
  //                     crossAxisSpacing: 10.0,
  //                     mainAxisSpacing: 10,
  //                   ),
  //                   itemBuilder: (context, index) {
  //                     return Categoryitem(
  //                         // ignore: deprecated_member_use
  //                         imgUrl: postSnapshot.documents[index].get("imageUrl"),
  //                         category:
  //                             postSnapshot.documents[index].get("category"),);
  //                   },
  //                 ),
  //               ],
  //             )
  //           : Center(
  //               child: Container(
  //                   alignment: Alignment.center,
  //                   child: CircularProgressIndicator()),
  //             ),
  //     ],
  //   );
  // }

  @override
  void initState() {
    super.initState();
    crudMethods.getCategory().then((results) {
      setState(() {
        postSnapshot = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xff6739B7),
      child: ListView(children: <Widget>[
        Container(
          color: Color(0xff6739B7),
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: TextField(
                          decoration: InputDecoration(
                              focusColor: Color(0xff6739B7),
                              fillColor: Color(0xff6739B7),
                              hoverColor: Color(0xff6739B7),
                              border: InputBorder.none,
                              hintText: 'Search Any Service...'),
                        ),
                      ),
                    ),
                    FlatButton(
                        onPressed: () {},
                        child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "Search",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),),)
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        items: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                "https://graphicriver.img.customer.envatousercontent.com/files/278099749/preview_13070075.jpg?auto=compress%2Cformat&q=80&fit=crop&crop=top&max-h=8000&max-w=590&s=d79f2ef088cc37d58faa7f986a62f148",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                            height: 160,
                            autoPlay: true,
                            autoPlayCurve: Curves.easeIn,
                            enlargeCenterPage: true),
                      )
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: null/*categoryList()*/
              )
            ],
          ),
        ),
      ]),
    ));
  }
}

class PostItem extends StatelessWidget {
  String imgUrl, name, desc, whatsAppNo, callingNo, number, wpNo, category;

  PostItem(
      {@required this.imgUrl,
      @required this.name,
      @required this.desc,
      @required this.whatsAppNo,
      @required this.callingNo,
      @required this.category});

  @override
  Widget build(BuildContext context) {
    number = "tel:+91" + callingNo;
    wpNo = "+91" + whatsAppNo;

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    (imgUrl),
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  )),
              SizedBox(width: 20),
              SizedBox(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 250,
                      child: Text(
                        name,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(desc,
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.normal)),
                    ),
                    Row(children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.black54,
                      ),
                      Text("Pune, Maharashtra",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.normal))
                    ])
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 80),
                child: FlatButton.icon(
                    onPressed: () => launch(number),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Color(0xff6739B7),
                    icon: Icon(IconData(57534, fontFamily: 'MaterialIcons'),
                        color: Color(0xffFFD700),
                    ),
                    label: new Text(
                      "Call Now",
                      style: new TextStyle(color: Color(0xffFFD700)),
                    )),
              ),
              SizedBox(width: 10),
              FlatButton.icon(
                  onPressed: () async => await launch(
                      "https://wa.me/${wpNo}?text=Hii, I found your business on KhojKare App!"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green)),
                  color: Colors.white,
                  icon: Icon(IconData(58058, fontFamily: 'MaterialIcons')
                      , color: Colors.green),
                  label: new Text(
                    "WhatsApp",
                    style: new TextStyle(color: Colors.green),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, right: 30, left: 30),
            height: 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.black38),
          )
        ],
      ),
    );
  }
}
