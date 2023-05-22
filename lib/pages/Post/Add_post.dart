// ignore_for_file: use_build_context_synchronously, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:geocoding/geocoding.dart';
import 'dart:io';

import '../../Home.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPostPage> {
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _publisheddateController =
      TextEditingController();

  File? _packageImage;
  String _imageUrl = '';

  // Function to add a package by the admin
  Future<void> addreviewAdmin() async {
    String Name = _NameController.text.trim();
    String Description = _descriptionController.text.trim();

    DateTime publisheddate = DateTime.now();
    // Validate package details
    if (Name.isEmpty || Description.isEmpty || publisheddate == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(
                'Please enter all package details, select an image, and provide a location.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }
    // Access the Firestore collection for packages
    CollectionReference packagesCollection =
        FirebaseFirestore.instance.collection('Post');

    // Upload package image to Firebase Storage
    String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageReference =
        FirebaseStorage.instance.ref().child('post_images/$imageName');
    UploadTask uploadTask = storageReference.putFile(_packageImage!);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    _imageUrl = await snapshot.ref.getDownloadURL();

    // Access the Firestore collection for packages

    // Create a new document with an auto-generated ID
    try {
      DocumentReference reviewRef = await packagesCollection.add({
        'Name': Name,
        'Description': Description,
        'publisheddate': publisheddate,
        'imageUrl': _imageUrl,
      });

      // Navigate to PackageListPage after adding a package
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text(' Successfully Added.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  // Navigator.of(context).pop();
                  // _resetFields();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to Upload the Post. Please try again.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _resetFields() {
    _NameController.clear();
    _descriptionController.clear();
    _publisheddateController.clear();
    _packageImage = null;
    _imageUrl = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add post'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  controller: _NameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  maxLines: 5,
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  controller: _publisheddateController,
                  decoration: InputDecoration(
                    labelText: 'Publis Date',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),

              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  // Select and set package image
                  final imagePicker = ImagePicker();
                  XFile? imageFile =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (imageFile != null) {
                    setState(() {
                      _packageImage = File(imageFile.path);
                    });
                  }
                },
                child: Text('Select Image'),
              ),
              const SizedBox(height: 16.0),
              _packageImage != null
                  ? Image.file(
                      _packageImage!,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    )
                  : Container(),
              const SizedBox(height: 16.0),
              // ElevatedButton(
              //   onPressed: addreviewAdmin,
              //   child: Text('Upload Movie Review'),
              // ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color.fromARGB(255, 90, 55, 172),
                  ),
                  child: ElevatedButton(
                    onPressed: addreviewAdmin,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      elevation: MaterialStateProperty.all<double>(0),
                    ),
                    child: Text(
                      'Upload',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
