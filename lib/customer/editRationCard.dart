import 'package:flutter/material.dart';
import './profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final formkey1 = GlobalKey<FormState>();
  TextEditingController _cardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return

      Scaffold(
        appBar: AppBar(
          title: Text('Edit ration_card'),
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
                      controller: _cardController,
                      decoration: InputDecoration(icon: Icon(Icons.assignment_ind,color: Colors.deepOrange   ),hintText: 'ration_card',labelText: 'رقم البطاقه'),
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

                        onPressed:()async{

                          if (formkey1.currentState.validate()) {

                            Firestore.instance.collection('User')
                                .document('My7TqqTjXmbi6TWww5SoT3lVnK73')
                                .updateData({
                              'ration_card': _cardController.text,
                            }).then((data) {
                              print ("_cardController.text${_cardController.text}");
                              _cardController.text=" ";

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