
import 'package:flutter/material.dart';
import './profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  final formkey1 = GlobalKey<FormState>();
  TextEditingController _memberController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return

      Scaffold(
        appBar: AppBar(
          title: Text('Edit member'),
          backgroundColor: Colors.deepOrange,
        ),
        body:Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200]))
          ),
          child:Form(
            key:formkey1,

            child:Column(

                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 35,right: 35,top: 10,),


                    child: new  TextFormField(
                      controller: _memberController,
                      decoration: InputDecoration(icon: Icon(Icons.accessibility,color: Colors.deepOrange   ),hintText: 'member',labelText: 'عدد الأعضاء'),
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the Number ';
                        }
                        return null;
                      },
                    ),
                  ),


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
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                          {
                            return DetailsScreen();
                          }));
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

                        onPressed:(){

                          if (formkey1.currentState.validate()) {

                            Firestore.instance.collection('User')
                                .document('My7TqqTjXmbi6TWww5SoT3lVnK73')
                                .updateData({
                              'member':_memberController.text,

                            }).then((data) {
                              print ("_memberController.text${_memberController.text}");
                              _memberController.text=" ";

                            });
                            setState(() {
                              print('edit');
                            });
                          }
                          else{
                            print("aaaaaaaaaaaaa");
                          }


                        },

                        elevation: 4.0,
                        splashColor: Colors.blueGrey,
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),

                    ],
                  ),

                ]

            ),
          ),
        ),
      );

  }

}



