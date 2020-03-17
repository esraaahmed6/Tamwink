//import 'package:cust/screens/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import './main_drawer.dart';
class DetailsScreen extends StatelessWidget {
  static const routeName= '/details-screen';
  @override
  Widget build(BuildContext context) {
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

                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://www.wepal.net/ar/uploads/2732018-073911PM-1.jpg'),

                  ),

                  Text('mohamed ali',style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                    width: 200,
                    child: Divider(
                      color: Colors.black54,
                    ),

                  ),
                  // once write Contairner the photo and text will write in center
                  Container(
                    child: Column(
                      children: <Widget>[

                        new  TextField(
                          decoration: InputDecoration(icon: Icon(Icons.email,color: Colors.deepOrange   ),labelText: 'البريد الالكتروني'),
                        ),
                        new  TextField(
                          obscureText: true,
                          decoration: InputDecoration(icon: Icon(Icons.lock,color: Colors.deepOrange   ),labelText: 'كلمة السر'),
                        ),
                        new  TextField(

                          decoration: InputDecoration(icon: Icon(Icons.accessibility,color: Colors.deepOrange   ),labelText: 'عدد الأعضاء'),
                        ),
                        new  TextField(

                          decoration: InputDecoration(icon: Icon(Icons.assignment_ind,color: Colors.deepOrange   ),labelText: 'رقم البطاقة'),
                        ),
                        new SizedBox(
                          height: 15.0,
                        ),
                        FlatButton(
                          onPressed: (){

                          },
                          textColor:  Colors.orange[900],
                          padding: const EdgeInsets.all(15),
                          child: Text('تغيير الصورة',style: TextStyle(fontSize: 17),),
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange[900]),
                            borderRadius: BorderRadius.circular(5),

                          ),

                        ),
                        new SizedBox(
                          height: 15.0,),
                        FlatButton(
                          onPressed: (){

                          },
                          textColor:  Colors.orange[900],
                          padding: const EdgeInsets.all(15),
                          child: Text('تحديث',style: TextStyle(fontSize: 20),),
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange[900]),
                            borderRadius: BorderRadius.circular(5),

                          ),

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

