import 'package:flutter/material.dart';
import './profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PassPage extends StatefulWidget {
  @override
  _PassPageState createState() => _PassPageState();
}

class _PassPageState extends State<PassPage> {
  final formkey1 = GlobalKey<FormState>();

  var _currentPassword ,_newPassword ,_confirmNewPassword ;
  TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmNewPasswordController = TextEditingController();
  //updateData


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return

      Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.orange[900],
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon:Icon(Icons.arrow_back,color:Colors.white),
            onPressed: (){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(
//
                          )
                  ),
                      (_) => false);
            },
          ),
          title: Text('Edit Password',
            style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 20.0,
              color:Colors.white,
            ),
          ),

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


                    child: TextFormField (
                      controller: _currentPasswordController,
                      cursorWidth: 1.2,
                      obscureText: true,
                      autocorrect: true,
                      //validator: PassValidator.Validate ,

                      // ,controller:userObject.firstName
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      autofocus: false,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,


                      style: TextStyle(


                        color: Colors.black,
                        letterSpacing: .5,
                        wordSpacing: 1.5,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Colors.red,
                      ),


                      decoration: InputDecoration(

                        hintText:'Current password ' ,
                        contentPadding: EdgeInsets.all(20),



                      ),

                      onSaved: (val)
                      {
                        _currentPassword = val ;
                      },

                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 35,right: 35,top: 10,),

                    child:   TextFormField (
                      controller:_newPasswordController,
                      cursorWidth: 1.2,
                      obscureText: true,
                      autocorrect: true,


                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      autofocus: false,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,


                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: .5,
                        wordSpacing: 1.5,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Colors.red,
                      ),


                      decoration: InputDecoration(

                        hintText:'New password ' ,
                        contentPadding: EdgeInsets.all(20),


                      ),
                      onSaved: (val)
                      {
                        _newPassword = val ;
                      },

                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 35,right: 35,top: 10,),


                    child:   TextFormField (
                      controller: _confirmNewPasswordController,
                      cursorWidth: 1.2,
                      obscureText: true,
                      autocorrect: true,

                      onSaved: (val)
                      {
                        _confirmNewPassword = val ;
                      },


                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      autofocus: false,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,


                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: .5,
                        wordSpacing: 1.5,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Colors.red,
                      ),


                      decoration: InputDecoration(

                        hintText:'Confirm password ' ,
                        contentPadding: EdgeInsets.all(20),


                      ),

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
                              'Password': _newPasswordController.text,
                            }).then((data) {

                              print ("_newPasswordController.text${_newPasswordController.text}");
                              _newPasswordController.text=" ";

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
/*class PassValidator{
  static String Validate (String value ){
    if(value.isEmpty){
      return "is empty";

    }
    return null;
  }
}*/