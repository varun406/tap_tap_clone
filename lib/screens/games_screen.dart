import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tap_tap_clone/components/game_card.dart';

class GameScreen extends StatefulWidget {
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Future<List>? catGames;
  var genre;
  int selectedIndex = 0;

  void changeTab(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<List> getCatGames() async {
    final res = await Dio().get("${Get.arguments['link']}");
    return res.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    catGames = getCatGames();
    genre = Get.arguments['genre'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "${Get.arguments['genre']} Category",
          style: TextStyle(fontFamily: "SecularOne"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 252, 13),
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            side: BorderSide()),
        onPressed: () {
          Get.snackbar("Hi", "Message", colorText: Colors.white);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: GNav(
          backgroundColor: Colors.black,
          activeColor: const Color.fromARGB(255, 0, 252, 13),
          color: Colors.white,
          iconSize: 23,
          onTabChange: (index) => changeTab(index),
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              onPressed: () => {Get.toNamed("/home")},
            ),
            GButton(
              icon: Icons.games_outlined,
              active: Get.currentRoute == "/games",
            ),
          ]),
      body: FutureBuilder<List>(
        future: catGames, // async work
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GameCard(
                    title: snapshot.data![index]['title'],
                    thumbnail: snapshot.data![index]['thumbnail'],
                    genre: snapshot.data![index]['genre'],
                  );
                },
                itemCount: snapshot.data?.length,
                scrollDirection: Axis.vertical,
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
    );
  }
}
