
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cash extends StatelessWidget {
  static const routeCash= '/cash-screen';
  @override
  Widget build(BuildContext context) {
    return
      Directionality( textDirection: TextDirection.rtl,
        child:
        Scaffold(
          //backgroundColor: Colors.amberAccent[100],
          appBar: AppBar(

            title: Text('دفع كاش'),
            backgroundColor: Colors.orange[900],
          ),
          // resizeToAvoidBottomPadding: false,
          //drawer: MainDrawer(),
          body: SafeArea(
            // SingleChildScrollView  to solve write problem
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://img2.arabpng.com/20180601/ava/kisspng-cash-on-delivery-payment-money-service-clip-art-tickets-5b11b21a21f1f4.1178754015278863621391.jpg'),

                  ),

                  /* Text('mohamed ali',style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),
              ),*/
                  SizedBox(
                    height: 20,
                    width: 200,
                    child: Divider(
                      color: Colors.black54,
                    ),

                  ),
                  FlatButton(
                    onPressed: (){

                    },
                    textColor:  Colors.white,
                    color: Colors.orange[900],
                    padding: const EdgeInsets.all(15),
                    child: Text('تأكيد الطلب',style: TextStyle(fontSize: 17),),
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange[900]),
                      borderRadius: BorderRadius.circular(10),

                    ),

                  ),
                  new SizedBox(
                    height: 15.0,),
                  // once write Contairner the photo and text will write in center
                  Container(
                    child: Column(
                      children: <Widget>[

                        new  TextField(
                          decoration: InputDecoration(icon: Icon(Icons.add,color: Colors.deepOrange   ),labelText: 'المحافظة'),
                        ),
                        new  TextField(
                          obscureText: true,
                          decoration: InputDecoration(icon: Icon(Icons.location_city,color: Colors.deepOrange   ),labelText: 'المدينة'),
                        ),
                        new  TextField(

                          decoration: InputDecoration(icon: Icon(Icons.streetview,color: Colors.deepOrange   ),labelText: 'الشارع'),
                        ),
                        new  TextField(
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(icon: Icon(Icons.phone,color: Colors.deepOrange   ),labelText: 'رقم الهاتف',
                          ),
                        ),
                        new SizedBox(
                          height: 15.0,
                        ),


                        //Icon(Icons.phone,color: Colors.black54   ),
                      ],
                    ),
                  ),

                  /*FloatingActionButton(

                backgroundColor: Colors.lightGreen,
                child: Icon(Icons.arrow_back ,color:  Colors.white,),
                onPressed: (){
                  Navigator.pop(context);

                },
              ),*/
                ],
              ),
            ),
          ),

        ),
      );
  }
}
