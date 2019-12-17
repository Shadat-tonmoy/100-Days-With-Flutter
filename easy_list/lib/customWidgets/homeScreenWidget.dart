import 'package:easy_list/constants/assetsConstants.dart';
import 'package:easy_list/tasks/appRoutingTask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenWidget
{

  final BuildContext context;

  HomeScreenWidget({@required this.context});

  Widget _getNavDrawerItem(String title, IconData icon, Function onPressCallback)
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

  Widget getEmptyListMessageWidget()
  {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/no_item.png"),
              fit: BoxFit.fill,
              width: 250,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "No Element Found!\nPlease tap the '+' button to add element",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]
                ),

              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getDrawerLayout()
  {
    AppRouter appRouter = AppRouter();
    return Container(
      width: 260.0,
      height: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView
      (
        child: Column(
          children: <Widget>[
            Image.asset(AssetsConstants.IMAGE_BASE_PATH+"food.jpg"),
            _getNavDrawerItem("Manage Product", Icons.edit,appRouter.getManageProductRouter()),
            _getNavDrawerItem("Manage Account", Icons.account_circle, appRouter.getManageProductRouter()),
          ],
        ),
      ),
    );
  }
}