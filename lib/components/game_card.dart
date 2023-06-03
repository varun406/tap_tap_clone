import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameCard extends StatelessWidget {
  final thumbnail;
  final title;
  final genre;

  GameCard({required this.title, required this.thumbnail, required this.genre});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed("/games", arguments: {
        "link":
            "https://www.freetogame.com/api/games?category=${genre.replaceAll(" ", "-")}",
        "genre": genre
      }),
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Column(children: [
          SizedBox(height: 200, child: Image.network(thumbnail)),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(7),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(thumbnail),
                          ),
                        ),
                        Text(
                          '${title}',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontFamily: "SecularOne",
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(9)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 10,
                          ),
                          Text(
                            '${genre}',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontFamily: "SecularOne",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
