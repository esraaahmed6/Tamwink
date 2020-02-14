import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget
{
  State<StatefulWidget>createState()
  {
    return _LoginPageState();
  }
}
class _LoginPageState extends State<LoginPage>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Tamwink"),
          centerTitle: true),
      body: new Container(
           margin: EdgeInsets.all(15.0),
           child: new Form
             (
             child: new Column(),

           ),
      ),
    );
  }
  List<Widget> createInputs()
  {
    return[SizedBox(height: 10.0,),
        Logo(),
        SizedBox(height: 20.0,),
      new TextFormField(decoration: new InputDecoration(labelText: 'Email'),),
      new TextFormField(decoration: new InputDecoration(labelText: 'Password'),),


    ];
  }
  Widget Logo()
  {
    return new Hero( child:new CircleAvatar(
      backgroundColor: Colors.transparent, 
      radius: 110.0,
      child:Image.asset("Images/t.jpg"),
    ));
  }
}