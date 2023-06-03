import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';
import 'package:tap_tap_clone/screens/games_screen.dart';
import 'package:tap_tap_clone/views/find_game_section.dart';
import 'package:tap_tap_clone/views/release_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tap Tap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 33, 31, 37)),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
            name: "/games",
            page: () => GameScreen(),
            transition: Transition.rightToLeft,
            transitionDuration: Duration(milliseconds: 250)),
        GetPage(
            name: "/",
            page: () => MyHomePage(),
            transition: Transition.rightToLeft,
            transitionDuration: Duration(milliseconds: 250))
      ],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  void changeTab(index) {
    setState(() {
      selectedIndex = index;
    });
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
          "Tap Tap",
          style: TextStyle(fontFamily: "SecularOne"),
        ),
        leading: IconButton(
            onPressed: () {
              print("menu pressed");
            },
            icon: Icon(Icons.menu_outlined)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  print("search pressed");
                },
                icon: Icon(Icons.search_outlined)),
          )
        ],
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
              active: Get.currentRoute == "/",
              onPressed: () => {Get.toNamed("/home")},
            ),
            GButton(
              icon: Icons.games_outlined,
              active: Get.currentRoute == "/games",
              onPressed: () => {
                Get.toNamed("/games", arguments: {
                  "link": "https://www.freetogame.com/api/games",
                  "genre": "All Categories",
                })
              },
            ),
          ]),
      body: SingleChildScrollView(
          child: Column(children: [ReleaseSection(), FindGameSection()])),
    );
  }
}
