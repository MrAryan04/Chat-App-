// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Database extends StatefulWidget {
//   const Database({super.key});

//   @override
//   State<Database> createState() => _DatabaseState();
// }

// class _DatabaseState extends State<Database> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

// Future savingUserData(String fullName, String email) async {
//   return await userCollection.doc(userid).set({
//     "fullName": fullName,
//     "email": email,
//     "profilePic": "",
//     "userid": userid,
//   });
// }

// // getting user data
// Future gettingUserData(String email) async {
//   QuerySnapshot snapshot =
//       await userCollection.where("email", isEqualTo: email).get();
//   return snapshot;
// }

// //get user name
// getUserNames() async {
//   return userCollection.doc(userid).snapshots();
// }
