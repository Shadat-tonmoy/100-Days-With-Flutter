import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/helpers/MessageHelper.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/styles.dart';
import 'package:flash_chat/constants/constant_values.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
FirebaseUser _loggedInUser;


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Firestore firestore = Firestore.instance;
  String _message, _userEmail;
  final TextEditingController messageTextEditingController = TextEditingController();

  Future<void> getCurrentLoggedInUser() async {
    _loggedInUser = await _firebaseAuth.currentUser();
    if (_loggedInUser!= null) {
      _userEmail = _loggedInUser.email;
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

  void getMessageStream() async {
    Stream<QuerySnapshot> messageStream =
        firestore.collection(DatabasePaths.MESSAGE_ROOT).snapshots();
    await for (var snapshot in messageStream) {
      for (var message in snapshot.documents) {
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
            MessageStream(firestore: firestore),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextEditingController,
                      onChanged: (value) {
                        _message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextEditingController.clear();
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

class MessageStream extends StatelessWidget
{
  final Firestore firestore;

  MessageStream({this.firestore});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
      firestore.collection(DatabasePaths.MESSAGE_ROOT).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data.documents.reversed;
          List<Widget> messageWidgets = [];
          for (var message in messages) {
            var text = message.data[DatabasePaths.MESSAGE_TEXT_ROOT];
            var sender =
            message.data[DatabasePaths.MESSAGE_SENDER_ROOT];
            messageWidgets
                .add(MessageBubble(text: text, sender: sender));
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 10.0),
              children: messageWidgets,
            ),
          );
        } else
          return Text("No Recent Chats");
      },
    );
  }
}



class MessageBubble extends StatelessWidget {

  bool isCurrentUser()
  {
    return sender == _loggedInUser.email;
  }

  final String text, sender;
  MessageBubble({this.text, this.sender});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isCurrentUser() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(2.0),
          child: Text(
            sender,
            style: TextStyle(
              fontSize: 12.0
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: isCurrentUser() ? Colors.lightBlue : Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: isCurrentUser() ? Radius.circular(30.0) : Radius.zero,
              topRight: isCurrentUser() ? Radius.zero : Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)
            ),
            boxShadow: [
              BoxShadow(color: Colors.grey,blurRadius: 5.0),]

          ),
          child: Text(
            text,
            style: TextStyle(
              color: isCurrentUser() ? Colors.white : Colors.grey[800],
            ),
          ),
        ),
        SizedBox(
          height: 16.0,
        )
      ],
    );
  }
}
