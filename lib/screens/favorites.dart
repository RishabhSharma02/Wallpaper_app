import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/favorite_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../homepage.dart';
import '../setter.dart';

class Favorites_scr extends StatefulWidget {
  final idx;
  const Favorites_scr({super.key, required this.idx});

  @override
  State<Favorites_scr> createState() => _Favorites_scrState();
}

class _Favorites_scrState extends State<Favorites_scr> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final images = provider.imgf;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 31, 115),
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
                              setter(imgurl: images[index]))));
                },
                child: Container(
                    color: Colors.white,
                    child: Image.network(images[index], fit: BoxFit.cover)),
              );
            })),
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
