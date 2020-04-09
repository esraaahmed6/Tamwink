import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tamwink/customer/maincustomer.dart';
import 'package:tamwink/services/usermanagement.dart';

class DashboardPage extends StatefulWidget
{
 @override
  _DashboardPageState createState()=> _DashboardPageState();

}
class _DashboardPageState extends State<DashboardPage>{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title:Text('Dashboard'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Raja'),
              accountEmail: new Text('testemail@test.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
              ),
            ),
            new ListTile(
              title: new Text('customer'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new MyHomePage()));
              },
            ),
            new ListTile(
              title: new Text('trader'),
              onTap: () {
               usermanagement().authorizeAccess(context);
              },
            ),
            new ListTile(
              title: new Text('Logout'),
              onTap: () {
                usermanagement().signOut();

              },
            ),
          ],
        ),
      ),
      body:Center(
        child: Text('Dashboaerd'),
      ),

    );
  }
}