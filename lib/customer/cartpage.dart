import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tamwink/customer/cartmodel.dart';
import 'package:tamwink/customer/cash.dart';
import 'package:tamwink/customer/paymentcredit.dart';
class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality( textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[900],
          title: Text("عربة التسوق"),
          actions: <Widget>[
            FlatButton.icon(
                label: Text(
                  "إلغاء الطلب",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => ScopedModel.of<CartModel>(context).clearCart(),
              icon:Icon(Icons.delete,color:Colors.white),
            ),
          ],
        ),
        body: ScopedModel.of<CartModel>(context, rebuildOnChange: true)
                    .cart
                    .length ==
                0
            ? Center(
                child: Text("لا يوجد منتجات في عربة التسوق"),
              )
            : Container(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: ScopedModel.of<CartModel>(context,
                              rebuildOnChange: true)
                          .total,
                      itemBuilder: (context, index) {
                        return ScopedModelDescendant<CartModel>(
                          builder: (context, child, model) {
                            return
                              ListTile(
                                  leading:
                                  SizedBox(
                                      height: 70.0,
                                      width:70.0, // fixed width and height
                                      child: Image.asset(model.cart[index].imgUrl,fit: BoxFit.contain,)
                                  ),
                              title: Text(model.cart[index].title),
                              subtitle: Text(
                                  model.cart[index].qty.toString() +
                                  " x " +
                                  model.cart[index].price.toString()+
                                  " = " +
                                  (model.cart[index].qty *
                                      model.cart[index].price)
                                      .toString(),
                                textAlign: TextAlign.end,
                                textDirection: TextDirection.ltr,

                              ),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(

                                      icon: Icon(Icons.add,),
                                      onPressed: () {
                                        model.updateProduct(model.cart[index],
                                            model.cart[index].qty + 1);
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        model.updateProduct(model.cart[index],
                                            model.cart[index].qty - 1);
                                        // model.removeProduct(model.cart[index]);
                                      },
                                    ),
                                  ]),

                              );
                          },
                        );
                      },
                    ),
                  ),
        Container(
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
                            ScopedModel.of<CartModel>(context,
                                    rebuildOnChange: true)
                                .totalCartValue
                                .toString() +
                            "جنية",

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
                            ScopedModel.of<CartModel>(context,
                                    rebuildOnChange: true)
                                .totalCartValue
                                .toString() +
                            "جنية",

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
        )

                ])))
    );
  }
}
