import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tamwink/db/customer_to_db.dart';
class Repage extends StatefulWidget {
  static String tag ='re-page';

  @override
  _RepageState createState() => _RepageState();
}

class _RepageState extends State<Repage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController rationController = new TextEditingController();
  @override

 String dropval ;
  void dropChange(String va){
    setState(() {
      dropval= va;
    });
  }
  Widget build(BuildContext context) {

    return
      Directionality( textDirection: TextDirection.rtl,

    child:Scaffold(
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
            SizedBox(height: 80,),
            Padding(
              ////////////////////////////////////////////
              padding:EdgeInsets.all(20),
              //  EdgeInsets.symmetric(vertical:18.0,horizontal: 280.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("التسجيل", style: TextStyle(color: Colors.white, fontSize: 40,),),
                  SizedBox(height: 10,),
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
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: "الاسم",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      icon: Icon(Icons.people)
                                  ),
                                ),
                              ),
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
                                  decoration: InputDecoration(
                                      hintText: "كلمة المرور",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                      icon: Icon(Icons.vpn_key)
                                  ),
                                  controller: passwordController,
                                ),
                              ),

                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child:  Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                        ),
                                        child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                              //  labelText: 'City',
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: InputBorder.none,
                                                // icon: Icon(Icons.location_city,color: Colors.deepOrange),
                                                contentPadding: EdgeInsets.all(10)
                                            ),
                                            hint: Text('حدد المنطقة'),
                                            onChanged: dropChange,
                                            value: dropval,
                                            items: <String>['فيصل','الهرم']
                                                .map<DropdownMenuItem<String>>((String value){
                                              return DropdownMenuItem<String>(
                                                child: Text(value),
                                                value: value,);
                                            }).toList()
                                        ),
                                      )
                                  ),
                                  SizedBox(width: 30,),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                      ),
                                      child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            //  labelText: 'City',
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: InputBorder.none,
                                              // icon: Icon(Icons.location_city,color: Colors.deepOrange),
                                              contentPadding: EdgeInsets.all(10)
                                          ),
                                          hint: Text('حدد االمحافظة'),
                                          onChanged: dropChange,
                                          value: dropval,
                                          items: <String>['فيصل','الهرم']
                                              .map<DropdownMenuItem<String>>((String value){
                                            return DropdownMenuItem<String>(
                                              child: Text(value),
                                              value: value,);
                                          }).toList()
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: " العنوان (بالتفصيل)",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                  controller: addressController,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      hintText: "رقم البطاقة",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                  controller: rationController,
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
                            onDoubleTap :(){},

                            child: Center(
                              child:

                              FlatButton(
                                onPressed: () {

                                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: phoneController.text, password: passwordController.text)
                                  .then((signedcustomer){
                                   customertodb().addNewUser(signedcustomer, context);
                                  }).catchError((e){
                                    print(e);
                                  });
                                },
                                child: Text("تسجيل", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),


                                ),


                              ),

                            ),
                          ),
                        ),


                        SizedBox(height: 18,),
                        Container(
                          child: MaterialButton(
                            onPressed :(){
                              Navigator.pushNamed(context,'/login');

                            },
                            child: Center(
                              child:    Text("تمتلك حساب بالفعل؟", style: TextStyle(color: Colors.grey),),
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
        ),
      ),
    ),);

  }
}

