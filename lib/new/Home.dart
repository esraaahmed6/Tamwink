/*import 'dart:js';
import 'package:js/js.dart';
import'package:js/js_util.dart';*/
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamwink/new/Servicess.dart';
import 'package:tamwink/new/Note.dart';
import 'package:tamwink/new/add_categoryy.dart';

import 'notedetails.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return
      Directionality(textDirection: TextDirection.rtl,

    child: Scaffold(
      appBar: AppBar(
        title: Text ('ادارة الاقسام'),
      ),
      body: StreamBuilder(
        stream: Servicess().getNotes(),
        builder: (BuildContext context , AsyncSnapshot<List<Note>> snapshot){
          if(snapshot.hasError || !snapshot.hasData)
            return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context,int index){
              Note note  = snapshot.data[index];
              return ListTile(
                title: Text(note.categoryname),
                trailing: Row (
                  mainAxisSize: MainAxisSize.min,
                  children:<Widget>[
                  IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.red,
                  onPressed: () => Navigator.push(context,MaterialPageRoute(
                    builder: (_) => AddCategory(note:note)
                  )),
                ),

                IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () => _deleteNote(context,note.id),
                      /*() async{
                    try{
                      await Servicess().deleteNote(note.id);
                    }
                    catch(e){
                      print(e);
                    }
                  },*/
                    ),
                  ]
                ),
                onTap :( )=>Navigator.push(context, MaterialPageRoute(
                  builder: (_)=>NoteDetailsPage(note:note),
                ),),
                //subtitle: Text(note.id),
              );
              },);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (_)=>AddCategory()
          ));
        },
      ),
    ));
  }
  void _deleteNote(BuildContext context,String id) async {
    if (await _showConfirmationDialog(context)) {
      try {
        await Servicess().deleteNote(id);
      }
      catch (e) {
        print(e);
      }
    }}
  Future <bool> _showConfirmationDialog(BuildContext context) async{
      return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          content: Text("هل متاكد تريد الحذف؟"),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.red,
              child: Text("حذف"),
              onPressed: ()=>Navigator.pop(context,true),
            ),
            FlatButton(
              textColor: Colors.black,
              child: Text("الغاء"),
              onPressed: ()=>Navigator.pop(context,false),
            ),
          ],
        ),
      );
  }

}
