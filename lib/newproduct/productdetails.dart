import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamwink/newproduct/product.dart';


class NoteDetailsPage extends StatelessWidget {
  final Note note;

  const NoteDetailsPage({Key key , @required this.note}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl,
          child:Scaffold(
            appBar: AppBar(
              title: Text('التفاصيل'),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 36.0, right: 0.0,left: 600.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(note.categoryname,style: Theme.of(context).textTheme.title.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                  ),),
                  const SizedBox(height: 46.0,),
                  Text("اسم المنتج :" ),
                  Text(note.categoryname),
                  const SizedBox(height: 46.0,),
                  Text("وصف المنتج :" ),
                  Text(note.description),
                  const SizedBox(height: 46.0,),
                  Text("سعر المنتج :" ),
                  Text(note.price.toString()),
                ],
              ),
            ),
          )    );
  }//
}
