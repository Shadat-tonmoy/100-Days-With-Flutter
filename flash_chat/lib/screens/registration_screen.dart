import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants/constant_values.dart';
import 'package:flash_chat/customWidgets/buttonWidgets.dart';
import 'package:flash_chat/styles.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
{

  String email, password;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _showRegistrationLoading = false;

  void updateLoadingState(bool state)
  {
    setState(() {_showRegistrationLoading = state;});
  }

  Future<void> signUpWithEmailAndPassword() async {
    print("Grabbed Valeu $email password $password instance $_firebaseAuth");
    try
    {
      if(_firebaseAuth==null)
        _firebaseAuth = FirebaseAuth.instance;
      updateLoadingState(true);
      final newUser = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      updateLoadingState(false);
      if(newUser != null)
        Navigator.pushNamed(context, ScreenRoutes.CHAT_SCREEN);
    }
    catch(e)
    {
      print("Exception "+e.toString());

    }


  }


  @override
  Widget build(BuildContext context) {
    print("FirebaseAuth $_firebaseAuth");
    return ModalProgressHUD(
      inAsyncCall: _showRegistrationLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: AnimationTags.ANIMATED_LOGO,
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  style: TextStyle(
                      color: Colors.grey[800]
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: kInputFieldDecoration.copyWith(hintText: "Enter your email"),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                  obscureText: true,
                  decoration: kInputFieldDecoration.copyWith(hintText: "Enter your password"),
                ),
                SizedBox(
                  height: 24.0,
                ),
                AppMaterialButton(
                  color: Colors.blueAccent,
                  text: "Register",
                  onPressedCallback: () async
                  {
                    await signUpWithEmailAndPassword();


                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
