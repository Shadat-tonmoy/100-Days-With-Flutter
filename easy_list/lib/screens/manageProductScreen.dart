import 'package:flutter/material.dart';

class ManageProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Manage Product"
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text:"Add Product",
              ),
              Tab(
                text: "All Products",
              )
            ],
          ),
        ),
        body: Container(

        ),
      ),
    );
  }
}
