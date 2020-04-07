import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrudFire{

  bool auth()
  {
    return FirebaseAuth.instance.currentUser() != null?true:false;
  }
  Future<void> create(data)async{
    if (auth()){
      Firestore.instance.collection('User').add(data);
    }
  }
}