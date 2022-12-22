import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:fluttertoast/fluttertoast.dart';

class Registerpage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const Registerpage({super.key, required this.showLoginPage});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _emailcontroller = TextEditingController();
  final _pwdcontroller = TextEditingController();
  final _confpwdcontroller = TextEditingController();
  @override
  Future signUp() async {
    if (_emailcontroller.text.substring(
            _emailcontroller.text.length - 10, _emailcontroller.text.length) !=
        "@gmail.com") {
      Fluttertoast.showToast(msg: "Enter valid email");
    }
    if (_pwdcontroller.text.isEmpty || _pwdcontroller.text.length < 6) {
      Fluttertoast.showToast(msg: "Length should be atleast 6");
    }
    if (_pwdcontroller.text == _confpwdcontroller.text) {
      Fluttertoast.showToast(msg: "Account created");
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _pwdcontroller.text.trim());
    } else {
      Fluttertoast.showToast(msg: "Passwords don't match!");
    }
  }

  void dispose() {
    _emailcontroller.dispose();
    _pwdcontroller.dispose();
    _confpwdcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 31, 115),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: Lottie.network(
                      "https://assets8.lottiefiles.com/packages/lf20_tpa51dr0.json"),
                  height: 300,
                ),
                Text("WALLIX",
                    style: GoogleFonts.nunito(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 255, 204))),
                Text("Register now!",
                    style: GoogleFonts.nunito(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextField(
                        controller: _emailcontroller,
                        decoration: InputDecoration(
                          hintText: "Email or Username",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextField(
                        controller: _pwdcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextField(
                        controller: _confpwdcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm password",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Center(
                          child: Text("Sign Up",
                              style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0)))),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 255, 204),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a member ? ",
                        style: GoogleFonts.nunito(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255))),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text("Sign In",
                          style: GoogleFonts.nunito(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 255, 204))),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
