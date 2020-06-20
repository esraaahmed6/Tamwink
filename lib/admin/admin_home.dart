import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tamwink/admin/add_product.dart';
import 'package:tamwink/admin/category_admin.dart';
import 'package:tamwink/admin/product.dart';
import 'package:tamwink/admin/search_products.dart';
import 'package:tamwink/new/Home.dart';
import 'package:tamwink/newproduct/home_product.dart';
import '../auth/login_page.dart';
import 'profile.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController productController = TextEditingController(); //
  GlobalKey<FormState> _categoryFormKey = GlobalKey();
  GlobalKey<FormState> _productFormKey = GlobalKey(); //
  CategoryService _categoryService = CategoryService();
  ProductService _productService = ProductService(); //

  TextEditingController productNameController = TextEditingController();
  TextEditingController quatityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: <Widget>[
                Expanded(
                    child: FlatButton.icon(
                        onPressed: () {
                          setState(() => _selectedPage = Page.dashboard);
                        },
                        icon: Icon(
                          Icons.dashboard,
                          color: _selectedPage == Page.dashboard
                              ? active
                              : notActive,
                        ),
                        label: Text('Dashboard'))),
                Expanded(
                    child: FlatButton.icon(
                        onPressed: () {
                          setState(() => _selectedPage = Page.manage);
                        },
                        icon: Icon(
                          Icons.sort,
                          color:
                              _selectedPage == Page.manage ? active : notActive,
                        ),
                        label: Text('Manage'))),
              ],
            ),
            elevation: 0.0,
            actions: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
                child: Ink(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0))),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: ProductSearch(),
                      );
                    },
                  ),
                ),
              )
            ],
            backgroundColor: Colors.white,
          ),
          body: _loadScreen()),
    );
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: <Widget>[
            ListTile(
              subtitle: FlatButton.icon(
                // onPressed: null,
                icon: Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Colors.green,
                ),
                label: Text('12,000',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0, color: Colors.green)),
              ),
              title: Text(
                'الايرادات',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.people_outline),
                              label: Text("المستخدمين")),
                          subtitle: Text(
                            '7',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.category),
                              label: Text("الاقسام")),
                          subtitle: Text(
                            '23',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.track_changes),
                              label: Text("المنتجات")),
                          subtitle: Text(
                            '120',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.tag_faces),
                              label: Text("المبيعات")),
                          subtitle: Text(
                            '13',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.shopping_cart),
                              label: Text("الطلبات")),
                          subtitle: Text(
                            '5',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.close),
                              label: Text("المستخدمون العائدون")),
                          subtitle: Text(
                            '0',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        break;
      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add),
              title: Text("اضافة منتج"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AddProduct()));
                // Navigator.push(context, MaterialPageRoute(builder: (_)=>FoodForm()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text("قائمة بالمنتجات"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text("اضافة منتج جديد"),
              onTap: () {
                _productAlert();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text("اضافة قسم"),
              onTap: () {
                _categoryAlert();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text("ادارة المنتجات"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePageProduct()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text("ادارة الاقسام"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("قائمة بالاقسام"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("الملف الشخصي"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DetailsScreen()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("خروج"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            Divider(),
          ],
        );
        break;
      default:
        return Container();
    }
  }

  void _categoryAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryFormKey,
        child: TextFormField(
          controller: categoryController,
          validator: (value) {
            if (value.isEmpty) {
              return 'category cannot be empty';
            }
          },
          decoration: InputDecoration(hintText: "اضافة قسم(نوع)"),
        ),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              if (categoryController.text != null) {
                _categoryService.createCategory(categoryController.text);
              }
              Fluttertoast.showToast(msg: 'تم اضافة قسم');
              Navigator.pop(context);
            },
            child: Text('اضافة')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('الغاء')),
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }

  void _productAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _productFormKey,
        child: Container(
          child: Column(children: <Widget>[
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                            child: Column(children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: productController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'category cannot be empty';
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "اضافة منتج (جديد)"),
                            ),
                          ),
                          //////////////////////////////////////////////////////////
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: productController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'category cannot be empty';
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "اضافة منتج (جديد)"),
                            ),
                          )
                        ]))
                      ])),
                ),
              ),
            )
          ]),
        ),
        /* child: TextFormField(
          controller: productController,
          validator: (value){
            if(value.isEmpty){
              return 'category cannot be empty';
            }
          },
          decoration: InputDecoration(
              hintText: "اضافة منتج (جديد)"
          ),
        ),*/
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              if (productController.text != null) {
                _productService.uploadProduct(
                  productNameController.text,
                  // quantity: int.parse(quatityController.text)
                );
              }
              Fluttertoast.showToast(msg: 'تم اضافة قسم');
              Navigator.pop(context);
            },
            child: Text('اضافة')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('الغاء')),
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  } //

}
