import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {

  String id;
  String email;
  String password;
  String member;
  String ration_card;
  String images;

  UserData({ this.id,this.email, this.password, this.member, this.ration_card, this.images});

  factory UserData.fromDoc(DocumentSnapshot doc) {
    return UserData(
      id: doc.documentID,
      email: doc['email'],
      password: doc['password'],
      member: doc['member'],
      ration_card: doc['ration_card'],
      images: doc['images'],
    );
  }
}
