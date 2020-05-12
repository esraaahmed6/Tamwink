import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tamwink/newproduct/product.dart';

class Servicess{
  static final Servicess _servicess = Servicess._internal();
  Firestore _db = Firestore.instance;
  Servicess._internal();
  factory Servicess(){
    return _servicess;
  }

  Stream<List<Note>>getNotes(){
    return _db.collection('productt').snapshots().map((snapshot)=>snapshot.documents.map((doc)=>Note.fromMap(doc.data, doc.documentID),
    ).toList()
    );

  }
  Future<void> addNote(Note note){
    return _db.collection('productt').add(note.toMap());
  }

  Future<void> deleteNote(String id){
    return _db.collection('productt').document(id).delete();
  }

  Future<void> updateNote(Note note){
    return _db.collection('productt').document(note.id).updateData(note.toMap());
  }

  Widget _buildbody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('productt').snapshots(),
      builder: (context , snapshot){
        if(!snapshot.hasData) return LinearProgressIndicator();
      },
    );
  }
  //////////////////////
  Future getImage(Note note) async {
    // Get image from gallery.
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _uploadImageToFirebase(image, note);
  }

  Future<void> _uploadImageToFirebase(File image,Note note) async {
    try {
      // Make random image name.
      int randomNumber = Random().nextInt(100000);
      String imageLocation = 'images/image${randomNumber}.jpg';

      // Upload image to firebase.
      final StorageReference storageReference = FirebaseStorage().ref().child(imageLocation);
      final StorageUploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.onComplete;
      _addPathToDatabase(imageLocation,note);
    }catch(e){
      print(e.message);
    }
  }

  Future<void> _addPathToDatabase(String text ,Note note) async {
      // Get image URL from firebase
      final ref = FirebaseStorage().ref().child(text);
      var imageString = await ref.getDownloadURL();
      // Add location and url to database

      await Firestore.instance.collection('productt').document().setData({'image' :imageString ,});
    }
////////

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////


