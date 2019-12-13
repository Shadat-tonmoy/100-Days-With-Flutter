import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenWidget
{
  static Widget getNavDrawerItem(String title, IconData icon, Function onPressCallback,BuildContext context)
  {
    return GestureDetector(
      onTap: (){
        onPressCallback(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.grey[600],
            ),
            SizedBox(
              width: 24.0,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
    );
  }

}