import 'package:flutter/material.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:flutter_application_2/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class setter extends StatefulWidget {
  final String imgurl;
  const setter({super.key, required this.imgurl});

  @override
  State<setter> createState() => _setterState();
}

class _setterState extends State<setter> {
  List<String> img = [];
  int k = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: provider.isExist(widget.imgurl)
            ? const Icon(Icons.favorite, color: Colors.red)
            : const Icon(Icons.favorite_border),
        onPressed: () {
          provider.toggleFavorite(widget.imgurl);
        },
      ),
      body: Hero(
        tag: HomePage,
        child: Container(
            color: Colors.black,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                        child: Image.network(widget.imgurl, fit: BoxFit.cover)))
              ],
            )),
      ),
    );
  }
}
