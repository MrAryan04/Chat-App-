import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fyp/chat.dart';
import 'package:fyp/pages/call.dart';
import 'package:fyp/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final screen = [
    const HomePage(),
    const ChatPage(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Homepage',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => const ProfileScreen()),
        //         );
        //       },
        //       icon: Icon(
        //         Icons.settings,
        //         size: 20,
        //         color: Colors.black,
        //       ))
        // ],
      ),
      //  body: Center(child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children:[
      //     MaterialButton(onPressed: (){
      //       FirebaseAuth.instance.signOut();
      //     },
      //     color: Colors.blue,
      //     child: Text('Sign Out'),
      //     )
      //   ]
      //  ),
      //  )

      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: _selectedIndex,
      //   // backgroundColor: Colors.grey[300],
      //   items: const[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat),
      //       label: 'Chat',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      //   onTap: (Index) => setState(() => this._selectedIndex = Index ),

      //   // onTap: _onItemTapped,
      // ),
      // body: IndexedStack(
      //   index: _selectedIndex,
      //   children: _widgetOptions,
      // ),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MyCall(callID: "1")));
          },
          child: const Text('Join Call'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
          ),
        ),
      ),
    );
  }
}
