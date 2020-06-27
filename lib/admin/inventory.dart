import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamwink/newproduct/product.dart';
import 'package:firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase_io.dart';
import 'package:tamwink/newproduct/productdetails.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ViewProducts>(context).fetchProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('المخزن')),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGridView(),
    );
  }
}

////////////////////////////////////////

class ProductsGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ViewProducts>(context);
    final products = productsData._items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: products[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}

////////////////////////////////////////

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Note>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                NoteDetailsPage.routeName,
                arguments: Note(),
              );
            },
            child: Hero(
              tag: product.id,
              child: FadeInImage(
                image: NetworkImage(
                  product.imagee,
                ),
                fit: BoxFit.cover,
              ),
            )),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            product.categoryname,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////

class ViewProducts with ChangeNotifier {
  List<Note> _items = [];
  final String userID;
  final String authToken;
  ViewProducts(this.authToken, this.userID, this._items);
  List<Note> get items {
    return [..._items];
  }

//  Note findById(String id) {
//    return _items.firstWhere((prod) => prod.id == id);
//  }
  ///////  NEEDS TO GET ACCESS TO THE FIREBASE TO KNOW THE NAME OF THE PRODUCTS TABLE //////

  Future<void> fetchProducts([bool filterByUser = false]) async {
    final filterString =
        filterByUser ? 'orderBy="creatorId"&equalTo="$userID"' : '';

    ////////////// modify this url to your project's one after getting access to it. ////////////
    var url =
        'https://tamwink-95ae5/database/firestore/data/productt.json?auth=$authToken&$filterString';
    ////// https://console.firebase.google.com/project/tamwink-95ae5/database/firestore/data/productt
    /////////////////////////////////////////////////////////////////////////////////////////////

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Note> loadedProducts = [];
      extractedData.forEach((id, data) {
        loadedProducts.add(Note(
          categoryname: data["categoryname"],
          description: data["description"],
          price: data["price"],
          quantity: data["quantity"],
          imagee: data["image"],
          id: id,
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }
}

//class inventory extends StatelessWidget {
//  inventory({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return null;
//  }
//}
