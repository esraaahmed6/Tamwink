import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamwink/bottom_bar.dart';
import 'package:tamwink/product_page.dart';
import 'package:tamwink/order_page.dart';
import 'package:tamwink/cash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon:Icon(Icons.arrow_back,color:Colors.white),
          onPressed: (){},
        ),
        title: Text('Tamwink',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color:Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.notifications_none,color:Colors.white),
            onPressed: (){},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left:20.0),
        children: <Widget>[
          SizedBox(height: 15.0,),
          Text('Categories',
            style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 42.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15.0,),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Colors.green,
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45.0),
            unselectedLabelColor: Color(0xFFCDCDCD),
            tabs: [
              Tab(
                child: Text('Grains',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 21.0,
                    )),
              ),
              Tab(
                child: Text('Detergents',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 21.0,
                    )),
              ),
              Tab(
                child: Text('Beverages',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 21.0,
                    )),
              )],

          ),
          Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: double.infinity,
              child: TabBarView(
                  controller: _tabController,
                  children: [
                    ProductPage(),
                    ProductPage(),
                    ProductPage(),
                  ]
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.green,
        child:IconButton(
          icon: Icon(Icons.add_shopping_cart),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OrderPage()
            ));
          },
        ),
        //Tab(icon: Icon(Icons.add_shopping_cart)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar : BottomBar(),
    );
  }
}


