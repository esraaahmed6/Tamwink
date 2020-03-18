import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tamwink/customer/maincustomer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tamwink/admin/admin_home.dart';
import 'package:tamwink/auth/regiter_page.dart';

class LoginPage extends StatefulWidget {
  static String tag ='Login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override


 /* String dropval ;
  void dropChange(String va){
    setState(() {
      dropval= va;
    });
  }*/

  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
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
            SizedBox(height: 100,),
            Padding(
              ////////////////////////////////////////////
              padding:EdgeInsets.all(20),
              //  EdgeInsets.symmetric(vertical:18.0,horizontal: 280.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("تموينك", style: TextStyle(color: Colors.white, fontSize: 40,),),
                  SizedBox(height: 24,),
                  Text("مرحبا بكم", style: TextStyle(color: Colors.white, fontSize: 18,),),

                ],
              ),
            ),
            SizedBox(height: 100),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
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
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      hintText: "رقم الهاتف",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      icon: Icon(Icons.phone)
                                  ),
                                  controller: phoneController,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: " كلمة المرور",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    icon: Icon(Icons.vpn_key)
                                  ),
                                    controller: passwordController,
                                ),
                              ),




                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 80,),
                        Container(
                          child: GestureDetector(
                            onDoubleTap :(){
                              Navigator.pushNamed(context, '/Pwpage');
                            },
                            child: Center(
                              child: Text("نسيت كلمة المرور؟", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                            ),
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
                            onDoubleTap :(){},
                             // Navigator.of(context).pushNamed(Repage.tag);          },
                            child: Center(
                              child:

                              FlatButton(
                                onPressed: () {

                                  FirebaseAuth.instance.signInWithEmailAndPassword(email: phoneController.text, password: passwordController.text
                                  ).then((FirebaseUsercustomer){
                                    Navigator.of(context).pushReplacementNamed('/home');
                                  }).catchError((e){
                                    print(e);
                                  });
                                },
                                child:
                                Text("تسجيل الدخول", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),


                                ),


                              ),

                            ),
                          ),
                        ),
                        SizedBox(height: 15.0,),
////////////////////////////////////////////////////////////////////////////////////////////////////////
                        Container(
                          child: MaterialButton(
                            onPressed :(){
                              Navigator.pushNamed(context, '/Repage');

                              },
                            child: Center(
                              child: Text("التسجيل كجديد", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////////////////////////////////
                        SizedBox(height: 24,),


                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}

