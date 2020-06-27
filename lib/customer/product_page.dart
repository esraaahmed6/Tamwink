import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamwink/customer/product_detail.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tamwink/customer/cartmodel.dart';

class ProductPage extends StatelessWidget {


  List<Product> _products = [
    Product(
        id: 1,
        title: "دقيق",
        price: 8.0,
        imgUrl: "assets/pic1.jpg",
        qty: 1),
    Product(
        id: 4,
        title: "مكرونة",
        price: 10.0,
        imgUrl: "assets/pic4.jpg",
        qty: 1),
    Product(
        id: 2,
        title: "سكر",
        price: 6.0,
        imgUrl: "assets/pic2.jpg",
        qty: 1),
    Product(
        id: 3,
        title: "أرز",
        price: 11.0,
        imgUrl: "assets/pic3.jpg",
        qty: 1),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 1,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                GridView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: _products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 0.8),
                  itemBuilder: (context, index){
                    return ScopedModelDescendant<CartModel>(
                        builder: (context, child, model) {
                          return Card( child: Column( children: <Widget>[
                             SingleChildScrollView(
                                child:Container(
                                    decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 3.0,
                                    blurRadius: 5.0)
                              ],
                              color: Colors.white,
                            ),
                          ),),
                            Padding(
                                padding: EdgeInsets.all(0.5),
                                child:
                                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                     Icon(Icons.favorite_border, color: Colors.orange[900]),
                            Image.asset(_products[index].imgUrl,
                              height: 75, width: 75,

                            )
                            ],)),
                            Text(_products[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF575E67),
                                  fontFamily: 'Varela',
                                  fontSize: 14.0
                              ),

                            ),
                            Text(_products[index].price.toString()+" جنية",

                            style: TextStyle(
                                color: Colors.orange[900],
                                fontFamily: 'Varela',
                                fontSize: 14.0
                            ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                            FlatButton.icon(
                              onPressed: (){
                                model.addProduct(_products[index]);
                              },
                              color: Colors.white,
                              shape: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange[900]),
                                borderRadius: BorderRadius.circular(20),

                              ),
                              label: Text('إضافة',
                              textAlign: TextAlign.start,
                              ),
                              icon: Icon(Icons.shopping_cart,color: Colors.orange[900]),
                            ),



//                            OutlineButton(
//                                child: Text("إضافة"),
//
//
//                                onPressed: () => model.addProduct(_products[index])
//                            ),
//                            Icon(Icons.shopping_cart, color: Colors.orange[900]),
                          ]));
                        });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetail(
                  assetPath: imgPath, productprice: price, productname: name)));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[

              Hero(
                  tag: imgPath,
                  child: Container(
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgPath),
                              fit: BoxFit.contain)))
              ),
              SizedBox(
                height: 7.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

}

