import 'package:flutter/material.dart';
import 'login.dart';
import 'register_page.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  bool showloginpage = true;
  void togglescreens() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return login(showRegisterPage: togglescreens);
    } else {
      return Registerpage(showLoginPage: togglescreens);
    }
  }
}
