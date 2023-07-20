import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fyp/chat.dart';
import 'package:fyp/chatpage.dart';
import 'package:fyp/pages/Post/Add_post.dart';
import 'package:fyp/pages/Post/View_post.dart';
import 'package:fyp/pages/call.dart';
import 'package:fyp/setting.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

            //  Container(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context)
            //           .push(MaterialPageRoute(builder: (context) => AddPostPage()));
            //     },
            //     child: const Text('Add Post'),
            //     style: ElevatedButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       elevation: 5,
            //     ),
            //   ),
            // ),
        //     GestureDetector(
        //   onTap: () {
        //     Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (context) => AddPostPage()));
        //   },
        //   child: Container(
        //     width: 70.0,
        //     height: 70.0,
        //     decoration: BoxDecoration(
        //       color: Colors.grey[300],
        //       borderRadius: BorderRadius.circular(10.0),
        //     ),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Icon(
        //           Icons.add,
        //           // size: 50.0,
        //           color: Colors.blue,
        //         ),
        //         SizedBox(height: 10.0),
        //         Text(
        //           'Add Post',
        //           style: TextStyle(
        //             // fontSize: 20.0,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
        );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter and Firebase Homepage',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter and Firebase Homepage'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Welcome to the Flutter and Firebase Homepage!'),
//             SizedBox(height: 20),
//             NavigationBar(
//               items: [
//                 NavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Home',
//                 ),
//                 NavigationBarItem(
//                   icon: Icon(Icons.settings),
//                   label: 'Settings',
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
