import 'package:flutter/material.dart';
import 'package:fyp/Home.dart';
import 'package:fyp/chat.dart';
import 'package:fyp/chatpage.dart';
import 'package:fyp/setting.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;
  final screen = [
    const HomePage(),
    // const ChatPage(),
    ChatScreen(),
    const ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) => setState(() => selectedIndex =index ),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: screen,
      ),
    );
  }
}
