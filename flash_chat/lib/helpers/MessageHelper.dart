
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/constants/constant_values.dart';

class MessageHelper
{
  static Map<String,dynamic> getMessageForDB({String message, String sender}){
    return {
      DatabasePaths.MESSAGE_TEXT_ROOT : message,
      DatabasePaths.MESSAGE_SENDER_ROOT : sender,
      DatabasePaths.MESSAGE_SENT_TIME : Timestamp.now().millisecondsSinceEpoch
    };
  }

}