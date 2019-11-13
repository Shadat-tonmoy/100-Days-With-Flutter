import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/constants/constant_values.dart';
import 'package:flash_chat/customWidgets/buttonWidgets.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation animation;

  @override
  void initState()
  {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

   /* animationController.forward();
    animationController.addStatusListener((status){
      if(status == AnimationStatus.completed){
        animationController.reverse(from: 60.0);
      }
      else if(status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });*/

   animationController.forward();
   animation = ColorTween(begin: Colors.blue[300], end: Colors.white).animate(animationController);

    animationController.addListener(()
    {
      setState(() {

      });
//      print(animationController.value);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: AnimationTags.ANIMATED_LOGO,
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text:['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            AppMaterialButton(
              color: Colors.lightBlueAccent,
              text: "Log In",
              onPressedCallback: (){
                Navigator.pushNamed(context, ScreenRoutes.LOGIN_SCREEN);
              },
            ),
            AppMaterialButton(
              color: Colors.blueAccent,
              text: "Register",
              onPressedCallback: (){
                Navigator.pushNamed(context, ScreenRoutes.REGISTRATION_SCREEN);
              },
            ),
          ],
        ),
      ),
    );
  }
}



