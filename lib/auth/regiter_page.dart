import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tamwink/services/app_methods.dart';
import 'package:tamwink/admin/admin_home.dart';
import 'package:tamwink/services/firebase_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tamwink/customer/maincustomer.dart';



class Repage extends StatefulWidget {
  Repage({Key key}) : super(key: key);
  @override
  _RepageState createState() => _RepageState();
}


class _RepageState extends State<Repage> {

  final userrefrence = Firestore.instance.collection('User');
  TextEditingController fullname = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController re_password = new TextEditingController();
  TextEditingController ration_card = new TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  // to read form
  final _formkey = GlobalKey<FormState>();
  BuildContext context;
  AppMethods appMethod = new FirebaseMethods();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    fullname.dispose();
    phoneNumber.dispose();
    password.dispose();
    email.dispose();
    re_password.dispose();
    ration_card.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    this.context = context;
    return
      Directionality(textDirection: TextDirection.rtl,

        child: Scaffold(
          body: Form(
            key: _formkey,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                          Colors.orange[900],
                          Colors.orange[800],
                          Colors.orange[400]
                        ]
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 80,),
                    Padding(
                      ////////////////////////////////////////////
                      padding: EdgeInsets.all(20),
                      //  EdgeInsets.symmetric(vertical:18.0,horizontal: 280.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("التسجيل", style: TextStyle(
                            color: Colors.white, fontSize: 40,),),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                    SizedBox(height: 100),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius
                                .circular(60), topRight: Radius.circular(60))
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 60,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [BoxShadow(
                                          color: Color.fromRGBO(
                                              225, 95, 27, .3),
                                          blurRadius: 20,
                                          offset: Offset(0, 10)
                                      )
                                      ]
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(
                                                color: Colors.grey[200]))
                                        ),
                                        child: TextFormField(
                                          // ignore: missing_return
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              hintText: "الاسم",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey),
                                              border: InputBorder.none,
                                              icon: Icon(Icons.people)
                                          ),
                                          controller: fullname,
                                          validator: validateName,
                                        ),

                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(
                                                color: Colors.grey[200]))
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              hintText: "رقم الهاتف",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey),
                                              border: InputBorder.none,
                                              icon: Icon(Icons.phone)
                                          ),
                                          controller: phoneNumber,
                                          validator: validateMobile,
                                        ),

                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(
                                                color: Colors.grey[200]))
                                        ),
                                        child: TextFormField(
                                          // ignore: missing_return

                                          decoration: InputDecoration(
                                              hintText: "البريد الالكتروني",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey),
                                              border: InputBorder.none,
                                              icon: Icon(Icons.email)
                                          ),
                                          controller: email,
                                          validator: emailValidator,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(
                                                color: Colors.grey[200]))
                                        ),
                                        child: TextFormField(
                                          // ignore: missing_return

                                          decoration: InputDecoration(
                                              hintText: "كلمة المرور",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey),
                                              border: InputBorder.none,
                                              icon: Icon(Icons.lock)
                                          ),
                                          controller: password,
                                          validator: pwdValidator,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(
                                                color: Colors.grey[200]))
                                        ),
                                        child: TextFormField(
                                          // ignore: missing_return

                                          decoration: InputDecoration(
                                              hintText: "إعادةكلمة المرور",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey),
                                              border: InputBorder.none,
                                              icon: Icon(Icons.lock)
                                          ),
                                          controller: re_password,
                                          validator: pwdValidator,
                                        ),
                                      ),


                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(
                                                color: Colors.grey[200]))
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              hintText: "رقم البطاقة",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey),
                                              border: InputBorder.none,
                                              icon: Icon(Icons.vpn_key)
                                          ),
                                          controller: ration_card,
                                          validator: validateCard,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40,),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.orange[900]
                                  ),
                                  child: GestureDetector(
                                    onDoubleTap: () {},

                                    child: Center(
                                      child:

                                      FlatButton(
                                          child: Text("تسجيل", style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),


                                          ),
                                          onPressed: () async {
                                            if (_formkey.currentState
                                                .validate()) {
                                              FirebaseAuth.instance
                                                  .createUserWithEmailAndPassword(
                                                  email: email.text,
                                                  password: password.text)
                                                  .then((currentUser) =>
                                                  Firestore.instance
                                                      .collection("User")
                                                      .document(
                                                    currentUser.user.uid,

                                                  )
                                                      .setData({

                                                    "uid": currentUser.user.uid,
                                                    'UserName': fullname.text,
                                                    'Email': email.text,
                                                    'Password': password.text,
                                                    'ration_card': ration_card
                                                        .text,
                                                    'PhoneNumber':
                                                    phoneNumber.text,

                                                  }).then((result) async {
                                                    setState(() {
                                                      print('add');
                                                    });

                                                    // ignore: sdk_version_set_literal
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (
                                                                context) =>
                                                                MyHomePage(
                                                                  /*  title: fullname.text,
                                                       uid: currentUser.user.uid,*/
                                                                )),
                                                            (_) => false);
                                                    fullname.clear();
                                                    email.clear();
                                                    password.clear();
                                                    ration_card.clear();
                                                    phoneNumber.clear();
                                                    re_password.clear();
                                                  }).catchError((err) =>
                                                      print(err))).catchError((
                                                  err) => print(err));
                                            }
                                            else {
                                              showDialog(
                                                  context: context,
                                                  builder: (
                                                      BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text("Error"),
                                                      content: Text(
                                                          "The passwords do not match"),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          child: Text("Close"),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                context)
                                                                .pop();
                                                          },
                                                        )
                                                      ],
                                                    );
                                                  });
                                            }
                                          }),

                                    ),
                                  ),
                                ),


                                SizedBox(height: 18,),
                                Container(
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    child: Center(
                                      child: Text(
                                        "تمتلك حساب بالفعل؟", style: TextStyle(
                                          color: Colors.grey),),
                                    ),
                                  ),
                                ),
                                ////////////////////////////////////////////////////////////////////////////////////
                                SizedBox(height: 15.0,),


                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
            ),
          ),
        ),);
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) return '*Required';
    if (!regex.hasMatch(value))
      return '*Enter a valid email';
    else
      return null;
  }

  //validate username//
  String validateName(String value) {
    if (value.isEmpty) return 'UserName is requierd';
    if (value.length < 3)
      return 'Please enter a valid name .';
    else
      return null;
  }


  ///validate phoneNumber///
  String validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  ////
  //validate cardNumber//
  String validateCard(String value) {
    if (value.isEmpty) return 'cardNumber is requierd';
    if (value.length != 12)
      return 'Please enter a valid Card .';
    /* if (value.length != 10 && value.startsWith('admin'))
      return 'Please enter a valid Card .';*/
    else
      return null;
  }

//validate password
  String pwdValidator(String value) {
    if (value.isEmpty) return 'Password is requierd';
    if (value.length < 6) {
      return 'Password must be longer than 6 characters';
    } else {
      return null;
    }
  }
}