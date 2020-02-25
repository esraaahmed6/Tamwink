//import 'package:cust/screens/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import './main_drawer.dart';
class DetailsScreen extends StatelessWidget {
  static const routeName= '/details-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(

        title: Text('Profile '),
        backgroundColor: Colors.lightGreen,
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
                      decoration: InputDecoration(icon: Icon(Icons.email,color: Colors.black54   ),labelText: 'Email'),
                    ),
                    new  TextField(
                      obscureText: true,
                      decoration: InputDecoration(icon: Icon(Icons.lock,color: Colors.black54   ),labelText: 'Password'),
                    ),
                    new  TextField(

                      decoration: InputDecoration(icon: Icon(Icons.accessibility,color: Colors.black54   ),labelText: 'Members'),
                    ),
                    new  TextField(

                      decoration: InputDecoration(icon: Icon(Icons.assignment_ind,color: Colors.black54   ),labelText: 'Card Number'),
                    ),
                    new SizedBox(
                      height: 15.0,
                    ),
                    FlatButton(
                      onPressed: (){

                      },
                      textColor:  Colors.lightGreen,
                      padding: const EdgeInsets.all(15),
                      child: Text('Change picture',style: TextStyle(fontSize: 17),),
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightGreen),
                        borderRadius: BorderRadius.circular(5),

                      ),

                    ),
                    new SizedBox(
                      height: 15.0,),
                    FlatButton(
                      onPressed: (){

                      },
                      textColor:  Colors.lightGreen,
                      padding: const EdgeInsets.all(15),
                      child: Text('Update',style: TextStyle(fontSize: 20),),
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightGreen),
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

    );
  }
}

