import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String senderId;
  String time;
  String date;
  String senderName;
  FieldValue timeStamp;
  String content;
  String chatId;

  MessageModel(
      {this.senderId,
      this.date,
      this.senderName,
      this.time,
      this.timeStamp,
      this.content,
      this.chatId});

  MessageModel.fromMap(Map map) {
    this.senderId = map['senderId'];
    this.time = map['time'];
    this.date = map['date'];
    this.senderName = map['senderName'];
    // this.timeStamp = map['timeStamp'];
    this.content = map['content'];
    this.chatId = map['chatId'];
  }

  toJson() {
    return {
      'senderId': this.senderId,
      'date': this.date,
      'time': this.time,
      'senderName': this.senderName,
      'timeStamp': this.timeStamp,
      'content': this.content,
      'chatId': this.chatId
    };
  }
}
