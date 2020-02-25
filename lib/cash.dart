
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cash extends StatelessWidget {
  static const routeCash= '/cash-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(

        title: Text('Cash '),
        backgroundColor: Colors.lightGreen,
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
                color: Colors.lightGreen,
                padding: const EdgeInsets.all(15),
                child: Text('proceed to pay',style: TextStyle(fontSize: 17),),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen),
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
                      decoration: InputDecoration(icon: Icon(Icons.add,color: Colors.black54   ),labelText: 'Country'),
                    ),
                    new  TextField(
                      obscureText: true,
                      decoration: InputDecoration(icon: Icon(Icons.location_city,color: Colors.black54   ),labelText: 'City'),
                    ),
                    new  TextField(

                      decoration: InputDecoration(icon: Icon(Icons.streetview,color: Colors.black54   ),labelText: 'Street'),
                    ),
                    new  TextField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(icon: Icon(Icons.phone,color: Colors.black54   ),labelText: 'Phone Number',
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

    );
  }
}
