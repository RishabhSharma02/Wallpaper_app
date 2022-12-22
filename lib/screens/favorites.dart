import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../homepage.dart';

class Favorites_scr extends StatefulWidget {
  final idx;
  const Favorites_scr({super.key, required this.idx});

  @override
  State<Favorites_scr> createState() => _Favorites_scrState();
}

class _Favorites_scrState extends State<Favorites_scr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          title: Text("Favorites",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 255, 204))),
          backgroundColor: Color.fromARGB(255, 10, 43, 154),
          centerTitle: true,
        ),
        bottomNavigationBar: GNav(
            selectedIndex: widget.idx,
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
                  icon: Icons.favorite_border_outlined,
                  text: "Favorites",
                  iconColor: Colors.white),
              GButton(
                  icon: Icons.search, text: "Search", iconColor: Colors.white),
            ],
            tabBorderRadius: 25,
            backgroundColor: Color.fromARGB(255, 10, 43, 154)));
  }
}
