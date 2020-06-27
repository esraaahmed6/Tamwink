import 'package:flutter/material.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:tamwink/addpage.dart';
import 'package:tamwink/auth/regiter_page.dart';
import 'package:tamwink/auth/login_page.dart';
import 'package:tamwink/auth/password_page.dart';
import 'package:tamwink/customer/maincustomer.dart';
import 'package:tamwink/admin/admin_home.dart';
import 'package:tamwink/new/Home.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tamwink/customer/cartmodel.dart';
import 'package:tamwink/customer/cartpage.dart';


void main() => runApp(MyApp(
  model: CartModel(),
));

class MyApp extends StatelessWidget {
  final CartModel model;

  const MyApp({Key key, @required this.model}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CartModel>(
        model: model,
        child:MaterialApp(
        // home: new HomePage(),
        //home: new Admin(),
        home: new LoginPage(),
        routes: <String , WidgetBuilder>{
          '/cart': (context) => CartPage(),
          '/landingpage':(BuildContext Context)=> new MyApp(),
          '/register': (BuildContext Context)=> new Repage(),
          '/password_page':(BuildContext Context)=> new Pwpage(),
          '/home':(BuildContext Context)=> new MyHomePage(),
          '/home_admin':(BuildContext Context)=> new Admin(),
          '/login':(BuildContext Context)=> new LoginPage(),
        }
        ),
    );
  }
}

