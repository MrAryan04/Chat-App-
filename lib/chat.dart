import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String currentUserUid = FirebaseAuth.instance.currentUser!.uid;

class ChatPage extends StatefulWidget {
  final String? chatId;

  const ChatPage({super.key, this.chatId});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc(widget.chatId)
                  .collection('messages')
                  .orderBy('createdAt')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<DocumentSnapshot> docs = snapshot.data!.docs;

                List<Widget> messages = docs
                    .map((doc) => Message(
                          from: doc['from'],
                          text: doc['text'],
                          me: doc['from'] == currentUserUid,
                        ))
                    .toList();

                return ListView(
                  controller: _scrollController,
                  children: <Widget>[...messages],
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                      contentPadding: const EdgeInsets.all(16.0),
                    ),
                    onSubmitted: (value) {
                      sendMessage();
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    sendMessage();
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage() {
    String text = _textEditingController.text;

    if (text.trim().length > 0) {
      FirebaseFirestore.instance
          .collection('chats')
          .doc(widget.chatId)
          .collection('messages')
          .add({
        'text': text,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
        'from': currentUserUid,
      });

      _textEditingController.clear();

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}

class Message extends StatelessWidget {
  final String from;
  final String text;
  final bool me;

  Message({required this.from, required this.text, required this.me});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
            crossAxisAlignment:
                me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              me
                  ? Expanded(child: Container())
                  : CircleAvatar(
                      child: Text(from[0]),
                    ),
              const SizedBox(width: 8.0),
              Expanded(
                  flex: 5,
                  child: Column(
                      crossAxisAlignment: me
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: <Widget>[Text(from, style: TextStyle())]))
            ]));
  }
}
