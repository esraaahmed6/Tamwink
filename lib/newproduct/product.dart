import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class Note extends ChangeNotifier {
  final String categoryname;
  final String description;
  final int price;
  final int quantity;
  String imagee;
  final String id;

  Note({
    this.categoryname,
    this.description,
    this.price,
    this.quantity,
    this.imagee,
    this.id,
    // String categoryname
  });
  Note.fromMap(Map<String, dynamic> data, String id)
      : categoryname = data["categoryname"],
        description = data["description"],
        price = data["price"],
        quantity = data["quantity"],
        imagee = data["image"],
        id = id;
  Map<String, dynamic> toMap() {
    return {
      "categoryname": categoryname,
      "description": description,
      "price": price,
      "quantity": quantity,
      "image": imagee
      // "name":name
    };
  }
}
