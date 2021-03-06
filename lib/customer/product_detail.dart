import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamwink/bottom_bar.dart';

class ProductDetail extends StatelessWidget
{
  final assetPath, productprice, productname;
  ProductDetail(
  {
    this.assetPath,
    this.productname,
    this.productprice,
}
      );

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
          onPressed: (){
            Navigator.of(context).pop();
          },
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
        children: <Widget>[
          SizedBox(height: 15.0),
//
          SizedBox(height: 15.0),
          Hero(
              tag: assetPath,
              child: Image.asset(assetPath,
                  height: 150.0,
                  width: 100.0,
                  fit: BoxFit.contain
              )
          ),
          SizedBox(height: 20.0),
          Center(
            child: Text(productprice,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[900])),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(productname,
                style: TextStyle(
                    color: Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 24.0)),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(' مكرونة حلقات كبيرة - 400 جم '
                  '  الماركة : Italiano|',


                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                      color: Color(0xFFB4B8B9))
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 25),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  ],
                )
              ],
            ),
          ),

         // SizedBox(height: 20.0),
          Center(
              child: Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.orange[900],
                  ),

                  child: Center(

                      child: Text('Add to cart',
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      )
                  ),
              )
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
        },
        backgroundColor: Colors.orange[900],
        child: Icon(Icons.add_shopping_cart, color: Colors.white,),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar : BottomBar(),
      ),
      );
  }

  void setState(Null Function() param0) {}
}