import 'package:flutter/material.dart';

class Categoryitem extends StatelessWidget {
  String imgUrl, category;

  Categoryitem({@required this.imgUrl, @required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(imgUrl),
          Text(
            category,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
