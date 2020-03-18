import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
class customertodb {

  addNewUser(customer , context)
  {
    FirebaseDatabase.instance.reference().child('customers')
        .push().set({}).then((value){}).catchError((e){
      print(e);
    });
    }





  }

