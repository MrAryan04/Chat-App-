import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Home.dart';
import 'package:fyp/forgotpassword.dart';
import 'package:fyp/register.dart';

class MyLogin extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const MyLogin({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/login.png',
                  height: 100,
                  width: 100,
                ),
                Text(
                  "Helping Hand",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.only(left: 35, right: 35),
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _passwordController,
                  style: const TextStyle(),
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sign in',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color(0xff4c505b),
                      child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            signIn();
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: widget.showRegisterPage,
                      child: const Text(
                        'Sign Up',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xff4c505b),
                            fontSize: 18),
                      ),
                      style: const ButtonStyle(),
                    ),
                    TextButton(
                        onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));},
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xff4c505b),
                            fontSize: 18,
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
