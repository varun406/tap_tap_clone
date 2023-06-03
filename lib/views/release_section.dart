import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../components/release_card.dart';
import '../components/section_heading.dart';

class ReleaseSection extends StatefulWidget {
  @override
  State<ReleaseSection> createState() => _ReleaseSectionState();
}

class _ReleaseSectionState extends State<ReleaseSection> {
  Future<List>? gameList;

  Future<List> getGames() async {
    var res = await Dio().get("https://www.freetogame.com/api/games");
    return res.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameList = getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionHeading(
              sectionTitle: "New Releases",
            ),
            FutureBuilder<List>(
              future: gameList, // async work
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 145,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ReleaseCard(
                          title: snapshot.data![index]['title'],
                          thumbnail: snapshot.data![index]['thumbnail'],
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                    ),
                  );
                }
                return Center(
                  child: LoadingAnimationWidget.prograssiveDots(
                    color: Colors.white,
                    size: 100,
                  ),
                );
              },
            ),
          ]),
    );
  }
}
