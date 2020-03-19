import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
class customertodb {

  addNewUser(customer , context)
  {
    FirebaseDatabase.instance.reference().child('customers')
        .push().set({
      'name': customer.name,
      'phone':customer.phone,
      'uid': customer.uid,
      'address':customer.address,
      'ration':customer.phone

    }).then((value){
     // Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/home');
    }).catchError((e){
      print(e);
    });
    }





  }

