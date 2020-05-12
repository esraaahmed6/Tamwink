import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
/////////////////////////////////////////////////////////////////////////////

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tamwink/addpage.dart';
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
  TextEditingController _quantityController;
  TextEditingController _imageeController;
  String imageurl;


  FocusNode _descriptionNode;

  get ref => null;

  get imageLocation => null;

  @override
  void initState(){
    super.initState();
    _categorynameController= TextEditingController(text: isEditNote ? widget.note.categoryname :' ');
    _descriptionController= TextEditingController(text: isEditNote ? widget.note.description :' ');
    _priceController= TextEditingController(text: isEditNote ? widget.note.price :' ');
    _quantityController= TextEditingController(text: isEditNote ? widget.note.quantity :' ');
    _imageeController= TextEditingController(text: isEditNote ? widget.note.imagee :' ');


    _descriptionNode = FocusNode();
  }
///////////////////////////////////////////////////
  File _imagefile;
  bool _uploaded = false;
  String _downloadurl;

  ////////////////////


  Future getimage(bool iscamera) async{
    File image;
    if(iscamera){
      image= await ImagePicker.pickImage(source: ImageSource.camera);
    }
    else{
      image= await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _imagefile= image;
    });
  }

  Future uploadImage() async {

    //var randomno = Random(24);
    //StorageReference _reference =FirebaseStorage.instance.ref().child('myimage.jpg');
  //  StorageReference _reference =FirebaseStorage.instance.ref().child('pictur/${randomno.nextInt(6000).toString()}.jpg');

    ////////////////////
    int randomNumber = Random().nextInt(100000);
    String imageLocation = 'images/image${randomNumber}.jpg';
    final StorageReference _reference = FirebaseStorage().ref().child(imageLocation);

    StorageUploadTask uploadTask= _reference.putFile(_imagefile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

    setState(() {
      _uploaded =true;
    });

// urlupl(imageLocation);
   // urlupl(imageLocation);

  }
  /*urlupl(imageLocation) async{
    final ref = FirebaseStorage().ref().child(imageLocation);
    var imageString = await ref.getDownloadURL();
    return imageString;
  }
*/
  String imageStringg;


  /*Future downloadimage() async{
    String downloadaddress= await _reference.getDownloadURL();
    setState(() {
      _downloadurl = downloadaddress;
    });
  }*/

  var imageString;

 /* Future<void> _addPathToDatabase() async {
    try {
      // Get image URL from firebase
      final ref = FirebaseStorage().ref();
       imageString = await ref.getDownloadURL();

      // Add location and url to database
      await Firestore.instance.collection('productt').document().setData({'image':imageString });
    }catch(e){
      print(e.message);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          }
      );
    }
  }*/
  ////////////////////////////////////////////////////////
  get isEditNote => widget.note!=null;
  @override
  Widget build(BuildContext context) {

    //////////////////////////////////////////
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
                      SizedBox(height: 17.0,),
                      /*RaisedButton(
                        child: Text('camera'),
                        onPressed: (){
                          getimage(true);
                        },
                      ),
                      SizedBox(height: 17.0,),
                      RaisedButton(
                        child: Text('gallery'),
                        onPressed: (){
                          getimage(false);
                        },
                      ),*/
                      SizedBox(height: 17.0,),
                      /*_imagefile == null ? Container () : Image.file(_imagefile),
                      _imagefile == null ? Container():RaisedButton(
                        child: Text('upload'),
                        onPressed: (){
                          uploadImage();
                        },
                      )*/
                      //_uploaded == false ? Container() :
                      /* RaisedButton(
                        child: Text('download'),
                        onPressed: (){
                          downloadimage();
                        },
                      ),*/
                      //_downloadurl == null ? Container() :Image.network(_downloadurl)   ,                   ///////////////////////////////////////////////

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
                            return "يجب ادخال وصف المنتج";
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
                      TextFormField(
                        keyboardType: TextInputType.number,
//                  keyboardType: ,
                        /* onEditingComplete: (){
                  FocusScope.of(context).requestFocus(_descriptionNode);
                },*/
                        controller: _quantityController,
                        validator:(value) {
                          if(value==null || value.isEmpty)
                            return "يجب ادخال كمية المنتج";
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'كمية المنتج',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 24.0,),
                      ////////////////////////////////////////////////////////////
                      SizedBox(height: 17.0,),
                      RaisedButton(
                        child: Text('camera'),
                        onPressed: (){
                          getimage(true);
                        },
                      ),
                      SizedBox(height: 17.0,),
                      RaisedButton(
                        child: Text('gallery'),
                        onPressed: (){
                          getimage(false);
                        },
                      ),
                      SizedBox(height: 17.0,),
                     _imagefile == null ? Container () : Image.file(_imagefile),
                      _imagefile == null ? Container():
                      /////////////////////////////////////////////////////////
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
                                    quantity: int.parse(_quantityController.text),
                                   // id: widget.note.id
                                );
                                await Servicess().updateNote(note);
                                ///////////////////////////////////////////////
                             // await Servicess().getImage(note);
                              }
                              else {
                                Note note = Note(categoryname :_categorynameController.text,
                                  description :_descriptionController.text,
                                  price: int.parse(_priceController.text),
                                  quantity: int.parse(_quantityController.text),
                                  //imagee: urlupl(imageLocation),
                                 //   id: widget.note.id,
                          );
                                await Servicess().addNote(note);
                                ///////////////////////////////////////////////////
                               uploadImage();
                               // await Servicess().getImage(note);

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
