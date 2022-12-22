import 'package:flutter/material.dart';
import 'package:flutter_application_2/homepage.dart';

class setter extends StatefulWidget {
  final String imgurl;
  const setter({super.key, required this.imgurl});

  @override
  State<setter> createState() => _setterState();
}

class _setterState extends State<setter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo, color: Color.fromARGB(255, 0, 255, 204)),
        backgroundColor: Color.fromARGB(255, 10, 43, 154),
        onPressed: () {},
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
