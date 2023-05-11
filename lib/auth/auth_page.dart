import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fyp/login.dart';
import 'package:fyp/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return MyLogin(showRegisterPage: toggleScreen);
    } else {
      return MyRegister(showLoginPage: toggleScreen);
    }
  }
}
