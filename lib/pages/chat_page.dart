// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ChatPage extends StatefulWidget {
//   final String userId;
//   final String userName;
//   const ChatPage({
//     Key? key,
//     required this.userId,
//     required this.userName,
//   }) : super(key: key);

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   Stream<QuerySnapshot>? chats;
//   String admin = "";

//   @override
//   void initState() {
//     getChatandAdmin();
//     super.initState();
//   }
//   getChatandAdmin(){

//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         title: Text(widget.userName),
//       ),
//       body: Center(child: Text(widget.userName)),
//     );
//   }
// }
