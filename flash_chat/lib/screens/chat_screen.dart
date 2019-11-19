import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/helpers/MessageHelper.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/styles.dart';
import 'package:flash_chat/constants/constant_values.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore firestore = Firestore.instance;
  FirebaseUser loggedinUser;
  String _message, _userEmail;

  Future<void> getCurrentLoggedInUser() async {
    loggedinUser = await _firebaseAuth.currentUser();
    if (loggedinUser != null) {
      _userEmail = loggedinUser.email;
    }
  }

  Future<void> logoutUser() async {
    await _firebaseAuth.signOut();
    Navigator.pop(context);
  }

  void sendMessageToFireStore() {
    firestore.collection(DatabasePaths.MESSAGE_ROOT).add(
        MessageHelper.getMessageForDB(message: _message, sender: _userEmail));
  }

  void getMessages() async {
    final messages =
        await firestore.collection(DatabasePaths.MESSAGE_ROOT).getDocuments();
    for (var message in messages.documents) {
      print("Message ${message.data}");
    }
  }

  void getMessageStream() async
  {
    Stream<QuerySnapshot> messageStream = firestore.collection(DatabasePaths.MESSAGE_ROOT).snapshots();
    await for(var snapshot in messageStream)
    {
      for(var message in snapshot.documents)
      {
        print(message.data);

      }
    }


  }

  @override
  void initState() {
    super.initState();
    getCurrentLoggedInUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                getMessageStream();
              }),
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                logoutUser();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: firestore.collection(DatabasePaths.MESSAGE_ROOT).snapshots(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  final messages = snapshot.data.documents;
                  List<Text> messageWidgets = [];
                  for(var message in messages)
                  {
                    var text = message.data[DatabasePaths.MESSAGE_TEXT_ROOT];
                    var sender = message.data[DatabasePaths.MESSAGE_SENDER_ROOT];
                    messageWidgets.add(Text("Text : $text, Sender : $sender"));
                  }
                  return Column(
                    children: messageWidgets,
                  );
                }
                else return Text("No Recent Chats");


              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        _message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      sendMessageToFireStore();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
