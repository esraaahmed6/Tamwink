import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tamwink/newproduct/product.dart';
import 'package:tamwink/newproduct/Services_Product.dart';


class AddCategory extends StatefulWidget {
  final Note note;

  const AddCategory({Key key, this.note}) : super(key: key);
  @override
  _AddCategoryState createState() => _AddCategoryState();
}
class _AddCategoryState extends State<AddCategory>{
  GlobalKey<FormState>_key =GlobalKey<FormState>();
  TextEditingController _categorynameController;
  TextEditingController _descriptionController;
  TextEditingController _priceController;

  FocusNode _descriptionNode;

  @override
  void initState(){
    super.initState();
    _categorynameController= TextEditingController(text: isEditNote ? widget.note.categoryname :' ');
    _descriptionController= TextEditingController(text: isEditNote ? widget.note.description :' ');
    _priceController= TextEditingController(text: isEditNote ? widget.note.price :' ');

    _descriptionNode = FocusNode();
  }

  get isEditNote => widget.note!=null;
  @override
  Widget build(BuildContext context) {

    return
      Directionality(textDirection: TextDirection.rtl,
          child:Scaffold(
              appBar: AppBar(
                title: Text(isEditNote ? 'تعديل المنتج' : 'اضافة منتج'),
              ),
              body:SingleChildScrollView(
                padding: const EdgeInsets.all(17.0),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ///////////////////////////////////////////////
                      TextFormField(
//                  keyboardType: ,
                        /* onEditingComplete: (){
                  FocusScope.of(context).requestFocus(_descriptionNode);
                },*/
                        controller: _categorynameController,
                        validator:(value) {
                          if(value==null || value.isEmpty)
                            return "يجب ادخال اسم للقسم";
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'اسم القسم',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 24.0,),
                      TextFormField(
                        maxLines: 6,
//                  keyboardType: ,
                        /* onEditingComplete: (){
                  FocusScope.of(context).requestFocus(_descriptionNode);
                },*/
                        controller: _descriptionController,
                        validator:(value) {
                          if(value==null || value.isEmpty)
                            return "يجب ادخال وثف المنتج";
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'وصف المنتج',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 24.0,),
                      TextFormField(
                        keyboardType: TextInputType.number,
//                  keyboardType: ,
                        /* onEditingComplete: (){
                  FocusScope.of(context).requestFocus(_descriptionNode);
                },*/
                        controller: _priceController,
                        validator:(value) {
                          if(value==null || value.isEmpty)
                            return "يجب ادخال سعر المنتج";
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'صعر المنتج',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 24.0,),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text(isEditNote ? "تعديل" : "حفظ"),
                        onPressed: () async{
                          if(_key.currentState.validate()){
                            try{
                              if(isEditNote){
                                Note note = Note(categoryname :_categorynameController.text,
                                    description :_descriptionController.text,
                                    price: int.parse(_priceController.text),
                                    id: widget.note.id);
                                await Servicess().updateNote(note);
                              }
                              else {
                                Note note = Note(categoryname :_categorynameController.text,
                                  description :_descriptionController.text,
                                  price: int.parse(_priceController.text),

                                );
                                await Servicess().addNote(note);

                              }
                              Navigator.pop(context);
                            }
                            catch(e){
                              print(e);
                            }}
                        },
                      )
                    ],
                  ),
                ),
              )
          ));
  }
}
