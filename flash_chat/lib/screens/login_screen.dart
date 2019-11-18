import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants/constant_values.dart';
import 'package:flash_chat/customWidgets/buttonWidgets.dart';
import 'package:flash_chat/styles.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{

  String _email, _password;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _showLoadingIndicator = false, _authResultVisibility = false;

  void updateLoadingIndicatorState(bool state)
  {
    setState(() {
      _showLoadingIndicator = state;
    });
  }

  void updateAuthResultState(bool state)
  {
    setState(() {
      _authResultVisibility = state;
    });
  }

  Future<void> loginUser() async
  {
    updateLoadingIndicatorState(true);
    updateAuthResultState(false);
    FirebaseUser firebaseUser = await _firebaseAuth.currentUser();
    if(firebaseUser == null)
    {
        try
        {
          AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(email: _email, password: _password);
          firebaseUser = authResult.user;
          if(firebaseUser!=null)
          {
            updateLoadingIndicatorState(false);
            Navigator.pushNamed(context, ScreenRoutes.CHAT_SCREEN);
          }
        }
        catch(e)
        {
          print("Login error ${e.toString()}");
          updateLoadingIndicatorState(false);
          updateAuthResultState(true);
        }
    }
    else {
      Navigator.pushNamed(context, ScreenRoutes.CHAT_SCREEN);
    }


  }

  @override
  void initState()
  {
    super.initState();
    _firebaseAuth = FirebaseAuth.instance;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: AnimationTags.ANIMATED_LOGO,
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    visible: _authResultVisibility,
                    child: Text(
                      "Login Failed! Please Check Your Email and Password and Try Again!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  TextField(
                    onChanged: (value) {
                      _email = value;
                    },
                    style: TextStyle(
                      color: Colors.grey[800]
                    ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: kInputFieldDecoration.copyWith(hintText: "Enter your email."),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    onChanged: (value) {
                      _password = value;
                    },
                    style: TextStyle(
                      color: Colors.grey[800]
                    ),
                    obscureText: true,
                    decoration: kInputFieldDecoration.copyWith(hintText: "Enter your password."),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  AppMaterialButton(
                    color: Colors.lightBlueAccent,
                    text: "Log In",
                    onPressedCallback: (){
                      loginUser();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        inAsyncCall: _showLoadingIndicator,
      ),
    );
  }
}
