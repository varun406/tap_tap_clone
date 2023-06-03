import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionHeading extends StatelessWidget {
  var sectionTitle = "";

  SectionHeading({required this.sectionTitle});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed("/games", arguments: {
        "link": "https://www.freetogame.com/api/games",
        "genre": "All Categories",
      }),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 5,
                      height: 20,
                      color: const Color.fromARGB(255, 0, 252, 13),
                    ),
                    Text(
                      sectionTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: "SecularOne",
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )),
            Icon(
              Icons.keyboard_arrow_right_outlined,
              size: 25,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
