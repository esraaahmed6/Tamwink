import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tamwink/auth/Dashboard.dart';
import 'package:tamwink/auth/login_page.dart';
import 'package:tamwink/admin/admin_home.dart';

class usermanagement {
  Widget handleAuth()
  {
    return new StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context,snapshot){
        if(snapshot.hasData)
          {
            return DashboardPage();
          }
        return LoginPage();
      },
    );

  }
  authorizeAccess(BuildContext context)
  {
    FirebaseAuth.instance.currentUser().then((user)
        {
          Firestore.instance.collection('/User').where('uid', isEqualTo: user.uid)
              .getDocuments()
              .then((docs)
              {
                if(docs.documents[0].exists)
                  {
                    if(docs.documents[0].data['role']=='trader')
                      {
                        Navigator.of(context).push(
                            new MaterialPageRoute(
                                builder:(BuildContext context) =>Admin()
                            )
                        );
                      }else{
                      print('Not Authorized');
                    }
                  }
              });
          
        });
    
  }
  signOut()
  {
    FirebaseAuth.instance.signOut();
  }
}