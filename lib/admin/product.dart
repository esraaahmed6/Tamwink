/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductService{
  Firestore _firestore = Firestore.instance;
  String ref = 'products';

  void uploadProduct({String productName , String category,int quantity , List sizes , List images , double price, })  //Map //@required

  {
    var id = Uuid();
    String productId = id.v1();

    _firestore.collection(ref).document(productId).setData({
      'name' : productName,
      'id':productId,
      'category':category,
      'quantity': quantity,
      'price':price,
      'image':images,
    });
  }
}*/
///////////////////////////////////////////////////////lastupdate

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'package:convert/convert.dart';

class ProductService{
  Firestore _firestore = Firestore.instance;
  String ref = 'products';

  void uploadProduct({ String productName , String category , int quantity ,List sizes ,List images , double price}){
    var id = Uuid();
    String productId = id.v1();

    _firestore.collection(ref).document(productId).setData({
      'name' : productName,
      'id':productId,
      'category':category,
      'quantity': quantity,
      'price':price,
      'image':images,

    });
  }

////////////////////////////////////////////////////
/*Map<String,dynamic> toMap(){
    'name' : productName,
    'id':productId,
    'category':category,
    'quantity': quantity,
    'price':price,
    'image':images
  };*/
///////////////////////////////////////////////////////////
/* Future <List<DocumentSnapshot>> getProduct() =>
      _firestore.collection(ref).getDocuments().then((snaps){
        return snaps.documents;
      });

  Future <List<DocumentSnapshot>> getSuggestions(String suggestion)
  => _firestore.collection(ref).where('product',isEqualTo: suggestion).getDocuments().then((snap){
    return snap.documents;
  });*/
///////////////////////////////////////////////////////

}