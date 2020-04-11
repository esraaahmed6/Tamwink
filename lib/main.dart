import 'package:flutter/material.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:tamwink/auth/regiter_page.dart';
import 'package:tamwink/auth/login_page.dart';
import 'package:tamwink/auth/password_page.dart';
import 'package:tamwink/customer/maincustomer.dart';
import 'package:tamwink/admin/admin_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new Admin(),
        //home: new LoginPage(),
        routes: <String , WidgetBuilder>{
          '/landingpage':(BuildContext Context)=> new MyApp(),
          '/register': (BuildContext Context)=> new Repage(),
          '/password_page':(BuildContext Context)=> new Pwpage(),
          '/home':(BuildContext Context)=> new MyHomePage(),
          '/home_admin':(BuildContext Context)=> new Admin(),
          '/login':(BuildContext Context)=> new LoginPage(),
        }

    );
  }
}

