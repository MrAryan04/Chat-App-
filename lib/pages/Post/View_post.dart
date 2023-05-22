import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class ViewPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          // ignore: prefer_const_constructors
          preferredSize: Size.fromHeight(4),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey.withOpacity(0.5),
              width: 1,
            ))),
          ),
        ),
        title: Text(
          'Helping Hand',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
        ),
        centerTitle: true,
      ),
      body: ViewPostListView(),
    );
  }
}

class ViewPostListView extends StatelessWidget {
  final bool showIcons;
  ViewPostListView({this.showIcons = true});

  void deletePost(String postId) {
    FirebaseFirestore.instance
        .collection('Post')
        .doc(postId)
        .delete()
        .then((value) {
      // Post deleted successfully
      // You can show a snackbar or toast message to indicate deletion
    }).catchError((error) {
      // An error occurred while deleting the post
      // You can show an error message to the user
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Post').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('No Post found.'),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot document = snapshot.data!.docs[index];
            Map<String, dynamic>? reviewData =
                document.data() as Map<String, dynamic>?;

            // Fetch the review details
            String? imageUrl = reviewData?['imageUrl'];
            String? Name = reviewData?['Name'];
            String? Description = reviewData?['Description'];
            DateTime? publishedDate = reviewData?['publishedDate']?.toDate();

            return Container(
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    imageUrl ?? '',
                    // fit: BoxFit.contain,
                    scale: 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Name ?? '',
                          style: TextStyle(
                            color: Color.fromARGB(255, 44, 54, 87),
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Description: ${Description ?? ''}'),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Published Date: ${publishedDate ?? ''}',
                          ),
                        ),
                        //Display the additional detail
                        //Text('Additional Detail: ${additionalDetail ?? ''}'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
