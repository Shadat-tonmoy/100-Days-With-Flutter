import 'package:flutter/material.dart';

class TODOItem extends StatelessWidget
{

  final String title;
  final bool isDone;
  final Function onCheckBoxClicked;

  TODOItem({this.title,this.isDone,this.onCheckBoxClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                    title
                ),
              ),
              Checkbox(
                onChanged: (value){

                },
                value: isDone,
              )

            ],
          ),
          Divider(
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }
}

class ModalBottomSheetBuilder extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
     color: Colors.blueAccent,
      child: Container(
        margin: EdgeInsets.only(top: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0),topRight: Radius.circular(16.0)),
            color: Colors.white,
          ),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0),topRight: Radius.circular(16.0)),
                  color: Colors.blueAccent,
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Add New Task",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0
                      ),
                    ),
                  )
                ],
              ),

            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                      Icons.edit,
                  ),
                  hintText: "Enter Task Name",
                ),
                autofocus: true,


              ),
            )
          ],

        ),
      ),
    );
  }


}