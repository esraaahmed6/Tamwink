import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tamwink/customer/maincustomer.dart';

class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  String _email ,  _password ;
  final GlobalKey<FormState>_formKey =GlobalKey<FormState>();
  TextEditingController passwordController = new TextEditingController();
  @override

  Widget build(BuildContext context) {


    return Scaffold(

      body: Form(
        key: _formKey,
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
                                    child: TextFormField(
                                      // ignore: missing_return
                                      validator: (input) {
                                        if(input.isEmpty){
                                          return 'Provide an email';
                                        }
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          hintText: "البريد الالكتروني",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          icon: Icon(Icons.email)
                                      ),
                                      onSaved: (input) => _email = input,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                    ),
                                    child: TextFormField(
                                      // ignore: missing_return
                                      validator: (input) {
                                        if(input.length < 6){
                                          return 'Longer password please';
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: " كلمة المرور",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          icon: Icon(Icons.vpn_key)
                                      ),
                                      onSaved: (input) => _password = input,
                                      obscureText: true,
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
                            SizedBox(height: 15.0,),
                            Container(

                              child: MaterialButton(
                                onPressed :(){
                                  Navigator.pushNamed(context,'/password_page');

                                },
                                child: Center(
                                  child: Text("نسيت كلمة المرور؟", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0,),
                            Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.orange[900]
                              ),

                              child: GestureDetector(
                                onDoubleTap :(){},

                                child: Center(
                                  child: FlatButton(
                                    onPressed: signIn,

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
                                  Navigator.pushNamed(context,'/register');

                                },
                                child: Center(
                                  child: Text("التسجيل كمستخدم جديد", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
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
    );

  }
  void signIn()async{
    if(_formKey.currentState.validate())
    {_formKey.currentState.save();
    try{
      AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);

      FirebaseUser user = result.user;
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(User: user)));
    }catch(e){
      print(e.message);
    }
    }
  }
}