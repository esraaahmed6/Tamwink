
//import 'dart:html';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tamwink/customer/crudfile.dart';
import './crudfile.dart';
//import 'dart:io';
//import './main_drawer.dart';

//class DetailsScreen extends StatelessWidget {
class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // img by type file
  File _image;
  CrudFile crud =new CrudFile();
  static const routeName= '/details-screen';
  final GlobalKey<FormState>_formState=GlobalKey<FormState>();
  String _email,_password,_member,_card;
  login()async{
    final formdata=_formState.currentState;
    if(formdata.validate()){
      formdata.save();

      FirebaseUser fireauth =
      (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email, password: _password,
      )) as FirebaseUser;
      /*print(_email);
     print(_password);
     print(_member);
     print(_card);*/
    }
  }
  addContact(){
    if(_formState.currentState.validate()){
      _formState.currentState.save();
      crud.create({
        'email':_email,
        'password':_password,
        'member':_member,
        'cardnumber':_card

      });
    }


  }



  @override
  Widget build(BuildContext context) {
    // when click on camera icon
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async{
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }

    return
      Directionality( textDirection: TextDirection.rtl,
        child:
        Scaffold(
          //backgroundColor: Colors.amberAccent[100],
          appBar: AppBar(

            title: Text('حسابي'),
            backgroundColor: Colors.orange[900],
          ),
          // resizeToAvoidBottomPadding: false,
          //drawer: MainDrawer(),
          body: SafeArea(
            // SingleChildScrollView  to solve write problem
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        // circle around photo
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.deepOrange,
                          child: ClipOval(
                            child: new SizedBox(
                              width: 180.0,
                              height: 180.0,
                              // if img!=null
                              child: (_image!=null)?Image.file(_image,
                                fit: BoxFit.fill,
                                // then
                              ):Image.network('https://www.wepal.net/ar/uploads/2732018-073911PM-1.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // to do camera
                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.camera,
                            size: 30.0,
                            color: Colors.pink,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),




                  // once write Contairner the photo and text will write in center
                  Container(
                    child: Column(
                      children: <Widget>[
                        Form(
                            key: _formState,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){}),
                                    leading: IconButton(icon: Icon(Icons.email), onPressed: (){}),
                                    title: Text('البريد الألكترني'),
                                    subtitle: Text('q@gmail.com'),
                                  ),

                                  ListTile(
                                    trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){}),
                                    leading: IconButton(icon: Icon(Icons.vpn_key), onPressed: (){}),
                                    title: Text('كلمة السر'),
                                    subtitle: Text('12345'),
                                  ),

                                  ListTile(
                                    trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){}),
                                    leading: IconButton(icon: Icon(Icons.accessibility), onPressed: (){}),
                                    title: Text('عدد الأعضاء'),
                                    subtitle: Text('5'),
                                  ),

                                  ListTile(
                                    trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){}),
                                    leading: IconButton(icon: Icon(Icons.assignment_ind), onPressed: (){}),
                                    title: Text('رقم البطاقة'),
                                    subtitle: Text('9876'),
                                  ),

                                  //////////////////////////////////////
                                  /*new  TextFormField(
                                    decoration: InputDecoration(icon: Icon(Icons.email,color: Colors.deepOrange   ),hintText: 'q@gmail.com ',labelText: 'البريد الالكتروني'
                                    ),
                                    // ignore: missing_return
                                    validator: (val){
                                      if(val.isEmpty){
                                        return ' ادخل البريد الالكتروني';
                                      }
                                    },
                                    onSaved: (val){
                                      _email = val;
                                    },
                                  ),

                                  new  TextFormField(
                                    obscureText: true,

                                    decoration: InputDecoration(icon: Icon(Icons.vpn_key,color: Colors.deepOrange   ),hintText: 'كلمه السر',labelText: 'كلمة السر'),
                                    // ignore: missing_return
                                    validator: (val){
                                      if(val.isEmpty){
                                        return ' ادخل كلمه السر';
                                      }
                                      else if(val.length< 3){
                                        return 'يجب ان لا تقل عن 4 حروف';
                                      }
                                    },
                                    onSaved: (val){
                                      _password = val;
                                    },

                                  ),

                                  new  TextFormField(

                                    decoration: InputDecoration(icon: Icon(Icons.accessibility,color: Colors.deepOrange   ),hintText: 'عدد الأعضاء',labelText: 'عدد الأعضاء'),
                                    // ignore: missing_return
                                    validator: (val){
                                      if(val.isEmpty){
                                        return ' ادخل عدد الأعضاء';
                                      }
                                    },
                                    onSaved: (val){
                                      _member = val;
                                    },
                                  ),
                                  new  TextFormField(

                                    decoration: InputDecoration(icon: Icon(Icons.assignment_ind,color: Colors.deepOrange   ),hintText: 'رقم البطاقة',labelText: 'رقم البطاقة'),
                                    // ignore: missing_return
                                    validator: (val){
                                      if(val.isEmpty){
                                        return ' ادخل رقم البطاقة';
                                      }
                                    },
                                    onSaved: (val){
                                      _card = val;
                                    },
                                  ),*/


                                  ///////////////////////////////////
                                  new SizedBox(
                                    height: 15.0,
                                  ),
                                  // .........two button.............
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      RaisedButton(
                                        color: Colors.deepOrange,
                                        onPressed: () {
                                          // cancel button
                                          Navigator.of(context).pop();
                                        },
                                        elevation: 4.0,
                                        splashColor: Colors.blueGrey,
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                                        ),
                                      ),
                                      RaisedButton(
                                        color: Colors.deepOrange,
                                        onPressed: (){
                                          // login,
                                          //upload picture
                                          uploadPic(context);
                                        },

                                        elevation: 4.0,
                                        splashColor: Colors.blueGrey,
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            )

                        ),


                        //Icon(Icons.phone,color: Colors.black54   ),
                      ],
                    ),
                  ),

                  /*FloatingActionButton(

                backgroundColor: Colors.lightGreen,
                child: Icon(Icons.arrow_back ,color:  Colors.white,),
                onPressed: (){
                  Navigator.pop(context);

                },
              ),*/
                ],
              ),
            ),
          ),

        ),
      );
  }
}

