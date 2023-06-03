import 'package:flutter/material.dart';

class ReleaseCard extends StatelessWidget {
  var title;
  var thumbnail;

  ReleaseCard({required this.title, required this.thumbnail});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            color: Colors.green[300]!.withOpacity(0.3)),
        child: Column(children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              image: new DecorationImage(
                  image: NetworkImage(thumbnail), fit: BoxFit.fill),
            ),
          ),
          Container(
            height: 60,
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SecularOne",
                      fontSize: 14)),
            ),
          )
        ]),
      ),
    );
  }
}
