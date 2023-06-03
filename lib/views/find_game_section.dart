import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tap_tap_clone/components/game_card.dart';
import 'package:tap_tap_clone/components/section_heading.dart';

class FindGameSection extends StatefulWidget {
  @override
  State<FindGameSection> createState() => _FindGameSectionState();
}

class _FindGameSectionState extends State<FindGameSection> {
  Future<List>? catGames;

  Future<List> getCatGames() async {
    final res = await Dio()
        .get("https://www.freetogame.com/api/games?category=Strategy");
    return res.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    catGames = getCatGames();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading(sectionTitle: "Find a game"),
        FutureBuilder<List>(
          future: catGames,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                height: 300,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return GameCard(
                      title: snapshot.data![index]['title'],
                      thumbnail: snapshot.data![index]['thumbnail'],
                      genre: snapshot.data![index]['genre'],
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
      ],
    );
  }
}
