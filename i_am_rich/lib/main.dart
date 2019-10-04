import 'package:flutter/material.dart';

void main()
{
    runApp(MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blueGrey,
            appBar: AppBar(
                backgroundColor: Colors.blueGrey[900],
                title: Text(
                    "I Am Rich"
                ),
            ),
            body: Center(
              child: Image(
                  image: NetworkImage(
                      'https://www.w3schools.com/w3css/img_lights.jpg'
                  ),
              ),
            )
        )
    ));

}