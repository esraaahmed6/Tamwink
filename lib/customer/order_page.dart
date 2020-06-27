import 'package:flutter/material.dart';
import 'package:tamwink/customer/order_cart.dart';
import 'package:tamwink/customer/cash.dart';
import 'package:tamwink/customer/paymentcredit.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
        title: Text('عربة التسوق',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color:Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.notifications,color:Colors.white),
            onPressed: (){},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          OrderCard(),
          OrderCard(),
        ],
      ),

      bottomNavigationBar: _buildTotalContainer(),
    ),
      );
  }

  Widget _buildTotalContainer() {
    return Container(
      height: 250.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "الإجمالي ",
                style: TextStyle(
                    color: Colors.orange[900],
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "30 جنية",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                " عدد النقاط ",
                style: TextStyle(
                    color: Colors.orange[900],
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "00 جنية",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//              Text(
//                "",
//                style: TextStyle(
//                    color: Color(0xFF9BA7C6),
//                    fontSize: 16.0,
//                    fontWeight: FontWeight.bold),
//              ),
//              Text(
//                "0.5",
//                style: TextStyle(
//                    color: Color(0xFF6C6D6D),
//                    fontSize: 16.0,
//                    fontWeight: FontWeight.bold),
//              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            height: 2.0,
            color: Colors.orange[900],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "السعر الكلي",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "\$ 10",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(


                child: FlatButton.icon(
                  icon: Icon(Icons.attach_money,color: Colors.white,),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Cash()
                    ));
                  },
                  color: Colors.orange[900],
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[900]),
                    borderRadius: BorderRadius.circular(30),

                  ),
                  label: Text('الدفع عند الاستلام',
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,),
                  ),
                ),

         ),
          SizedBox(
            height: 35.0,
            child: FlatButton.icon(
              shape: OutlineInputBorder(
                borderSide: BorderSide(color:Colors.orange[900]),
                borderRadius: BorderRadius.circular(30),

              ),
              icon: Icon(Icons.credit_card,color: Colors.white,),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Payment()
                ));
              },
              color: Colors.orange[900],
              label: Text('دفع بالبطاقة البنكية',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
