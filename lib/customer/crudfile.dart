import'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudFile {

  bool auth(){
    return FirebaseAuth.instance.currentUser() != null? true:false;
  }

  Future<void> create(data) async{
    if(auth()){
      Firestore.instance.collection('contacts').add(data);
    }
  }

}

