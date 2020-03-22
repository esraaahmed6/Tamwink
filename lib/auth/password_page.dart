import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class Pwpage extends StatefulWidget {
  static String tag ='pw-page';

  @override
  _PwpageState createState() => _PwpageState();
}

class _PwpageState extends State<Pwpage> {
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
                  Text("نسيت كلمة المرور", style: TextStyle(color: Colors.white, fontSize: 24,),),
                  SizedBox(height: 10,),
                  Text("اعادة تعيين", style: TextStyle(color: Colors.white, fontSize: 18,),),

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
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 100,),
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
                              child: Text("ارسال", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                        SizedBox(height: 18,),

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

