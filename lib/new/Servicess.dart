import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tamwink/new/Note.dart';

class Servicess{
  static final Servicess _servicess = Servicess._internal();
  Firestore _db = Firestore.instance;
  Servicess._internal();
  factory Servicess(){
    return _servicess;
  }

  Stream<List<Note>>getNotes(){
    return _db.collection('category').snapshots().map((snapshot)=>snapshot.documents.map((doc)=>Note.fromMap(doc.data, doc.documentID),
    ).toList()
    );
  }
  Future<void> addNote(Note note){
    return _db.collection('category').add(note.toMap());
  }

  Future<void> deleteNote(String id){
    return _db.collection('category').document(id).delete();
  }

  Future<void> updateNote(Note note){
    return _db.collection('category').document(note.id).updateData(note.toMap());
  }

}