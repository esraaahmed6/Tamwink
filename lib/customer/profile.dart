//import 'dart:html';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tamwink/customer/crudfile.dart';
import './crudfile.dart';
import 'package:progress_indicators/progress_indicators.dart';
import './editPassword.dart';
import './member.dart';
import './editRationCard.dart';
import 'package:tamwink/customer/maincustomer.dart';
import 'product_detail.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // img by type file
  File _image;
  CrudFile crud = new CrudFile();
  static const routeName = '/details-screen';
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final formkey1 = GlobalKey<FormState>();

  var _email, _member, _card, _images;
  var _password, _newPassword, _confirmNewPassword;
  //String _email,_password,_member,_card;
  login() async {
    final formdata = _formState.currentState;
    if (formdata.validate()) {
      formdata.save();

      FirebaseUser fireauth =
          (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      )) as FirebaseUser;
    }
  }

  addContact() {
    if (_formState.currentState.validate()) {
      _formState.currentState.save();
      crud.create({
        'email': _email,
        'password': _password,
        'member': _member,
        'cardnumber': _card,
        'images': _image
      });
    }
  }

  // get currentUser
  FirebaseUser user;
  getuserdata() async {
    FirebaseUser userdata = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = userdata;
    });
  }

  @override
  void initState() {
    super.initState();
    getuserdata();
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

    Future<String> uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      String url = await (taskSnapshot.ref.getDownloadURL());
      return url;
      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetail(
//
                        )),
                (_) => false);
          },
        ),
        title: Text(
          'تموينك',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('User')
              .where('Email', isEqualTo: 'erao11@gmail.com')
              .snapshots(),

          // ignore: missing_return
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: Center(
                child: HeartbeatProgressIndicator(
                    child: Icon(
                      Icons.person,
                      size: 15,
                    ),
                    duration: Duration(seconds: 4)),
              ));
            }
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return Column(
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
                                child: (_image != null)
                                    ? Image.file(
                                        _image,
                                        fit: BoxFit.fill,
                                        // then
                                      )
                                    : Image.network(
                                        '${snapshot.data.documents[index]['images']}',
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
                                      /* trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){
                                        //Navigator.of(context).pop();
                                        // updateData(context, snapshot.data.documents[index].documentID);
                                        Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                        builder: (context) =>
                                                 EmailPage(
//
                                               )),
                                               (_) => false);
                                          }),*/

                                      leading: IconButton(
                                          icon: Icon(Icons.email),
                                          onPressed: () {}),
                                      title: Text('البريد الألكترني'),
                                      subtitle: Text(
                                          '${snapshot.data.documents[index]['Email']}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                          )),
                                    ),

                                    ListTile(
                                      trailing: IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PassPage(
//
                                                            )),
                                                (_) => false);
                                          }),
                                      leading: IconButton(
                                          icon: Icon(Icons.vpn_key),
                                          onPressed: () {}),
                                      title: Text('كلمة السر'),
                                      subtitle: Text(
                                          '${snapshot.data.documents[index]['Password']}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                          )),
                                    ),

                                    ListTile(
                                      trailing: IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MemberPage(
//
                                                          )),
                                            );
                                          }),
                                      leading: IconButton(
                                          icon: Icon(Icons.accessibility),
                                          onPressed: () {}),
                                      title: Text('عدد الأعضاء'),
                                      subtitle: Text(
                                          '${snapshot.data.documents[index]['member']}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                          )),
                                    ),

                                    ListTile(
                                      trailing: IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CardPage(
//
                                                            )),
                                                (_) => false);
                                          }),
                                      leading: IconButton(
                                          icon: Icon(Icons.assignment_ind),
                                          onPressed: () {}),
                                      title: Text('رقم البطاقة'),
                                      subtitle: Text(
                                          '${snapshot.data.documents[index]['ration_card']}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                          )),
                                    ),
                                    ///////////////////////////////////
                                    new SizedBox(
                                      height: 15.0,
                                    ),
                                    // .........two button.............
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        RaisedButton(
                                          color: Colors.deepOrange,
                                          onPressed: () {
                                            // cancel button
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return MyHomePage();
                                            }));
                                          },
                                          elevation: 4.0,
                                          splashColor: Colors.blueGrey,
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0),
                                          ),
                                        ),
                                        RaisedButton(
                                          color: Colors.deepOrange,
                                          onPressed: () async {
                                            // login,
                                            //upload picture
                                            String imageurl =
                                                await uploadPic(context);
                                            if (imageurl != null) {
                                              List<String> _image = [imageurl];

                                              await Firestore.instance
                                                  .collection('User')
                                                  .document(
                                                      "My7TqqTjXmbi6TWww5SoT3lVnK73 ")
                                                  .setData({'images': _image});
                                            }
                                            /*  if (formkey1.currentState.validate()) {
                                              String imageurl= await uploadPic(context);
                                              //print(imageurl);
                                              List<String> _image =[imageurl];
                                              await Firestore.instance.collection('User')
                                                  .document("My7TqqTjXmbi6TWww5SoT3lVnK73 ").setData({
                                               // 'member':_member,
                                               // 'email':_email,
                                               // 'password':_password,
                                                //'cardnumber':_card,
                                                'images':_image

                                                  });

                                            }*/
                                            uploadPic(context);
                                          },
                                          elevation: 4.0,
                                          splashColor: Colors.blueGrey,
                                          child: Text(
                                            'upload photo',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),

                          //Icon(Icons.phone,color: Colors.black54   ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
