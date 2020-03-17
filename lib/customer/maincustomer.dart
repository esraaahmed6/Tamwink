import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamwink/bottom_bar.dart';
import 'package:tamwink/customer/Product_Page.dart';
//import 'package:tamwink/payment.dart';
import 'package:tamwink/customer/order_page.dart';


class MyHomePage extends StatefulWidget {

  @override

  _MyHomePageState createState() =>

      _MyHomePageState();
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
    return
      Directionality( textDirection: TextDirection.rtl,
        child:
        Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.orange[900],
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
              icon:Icon(Icons.arrow_back,color:Colors.white),
              onPressed: (){},
            ),
            title: Text('تموينك',
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
              Text('الأقسام',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.0,),
//          Directionality( textDirection: TextDirection.rtl,
//         child:
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.orange[900],
                isScrollable: true,
                labelPadding: EdgeInsets.only(right: 45.0),
                unselectedLabelColor: Color(0xFFCDCDCD),
                tabs: [
                  Tab(
                    child: Text(' البقوليات',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 21.0,
                        )),
                  ),
                  Tab(
                    child: Text('المنظفات',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 21.0,
                        )),
                  ),
                  Tab(
                    child: Text('مشروبات',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 21.0,
                        )),
                  )],
              ),
              // ),
//      Directionality( textDirection: TextDirection.rtl,
//        child:
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
              ),
              //),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            backgroundColor: Colors.orange[900],
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
        ),
      );
  }
}