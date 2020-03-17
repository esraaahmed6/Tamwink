import 'package:flutter/material.dart';
import 'package:tamwink/customer/profile.dart';

class BottomBar extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape : CircularNotchedRectangle(),
        notchMargin: 6.0,
      color: Colors.white,
      elevation: 9.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0)
        ),
        color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width /2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.home, color: Colors.orange[900]),

                  IconButton(
                    icon:  Icon(Icons.person_outline,
                      color: Colors.orange[900],

                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen()
                      ));
                    },
                  ),
                ],
              ),

            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width /2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.monetization_on, color: Colors.orange[900]),
                  Icon(Icons.favorite_border, color: Colors.orange[900])
                ],
              ),

            )
          ],
        ),
      )
    );
  }
}