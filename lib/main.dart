import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamwink/LoginPage.dart';

void main()
{
     runApp(new BlogApp());
}
class BlogApp extends StatelessWidget
{
    @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: "Tamwink App",
      theme: new ThemeData
        (
        primarySwatch:Colors.green,


      ),
      home: LoginPage(),
    );
  }
}