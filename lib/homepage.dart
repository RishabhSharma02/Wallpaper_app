// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/setter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/screens/favorites.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int page = 1;
  List images = [];
  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
        headers: {
          'Authorization':
              '563492ad6f9170000100000153bae9d1e6f3495ebab64d7e50db8ad2'
        }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
    });
  }

  loadmore() async {
    setState(() {
      page = page + 1;
    });
    String url =
        'https://api.pexels.com/v1/curated?per_page=80&page=' + page.toString();
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f9170000100000153bae9d1e6f3495ebab64d7e50db8ad2'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);
      });
    });
  }

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.replay_outlined,
            color: Color.fromARGB(255, 0, 255, 204)),
        backgroundColor: Color.fromARGB(255, 10, 43, 154),
        onPressed: () {
          loadmore();
        },
      ),
      body: GridView.builder(
          itemCount: images.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 2 / 3),
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            setter(imgurl: images[index]['src']['large2x']))));
              },
              child: Container(
                  color: Colors.white,
                  child: Image.network(images[index]['src']['tiny'],
                      fit: BoxFit.cover)),
            );
          })),
      backgroundColor: Color.fromARGB(255, 0, 31, 115),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        title: Text("Explore",
            style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 255, 204))),
        backgroundColor: Color.fromARGB(255, 10, 43, 154),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: GNav(
          selectedIndex: 0,
          activeColor: Color.fromARGB(255, 0, 255, 204),
          gap: 8,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            GButton(
                icon: Icons.home,
                text: "Home",
                iconColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            GButton(
                onPressed: () {
                  currentIndex = currentIndex + 1;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const Favorites_scr(idx: 1))));
                },
                icon: Icons.favorite_border_outlined,
                text: "Favorites",
                iconColor: Colors.white),
            GButton(
                icon: Icons.search, text: "Search", iconColor: Colors.white),
          ],
          tabBorderRadius: 25,
          backgroundColor: Color.fromARGB(255, 10, 43, 154)),
    );
  }
}
