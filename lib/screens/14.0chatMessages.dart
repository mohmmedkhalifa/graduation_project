import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:get/get.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/models/messageModel.dart';
import 'package:graduation_project/models/sellerModel.dart';
import 'package:graduation_project/widgets/5appBar.dart';

class ChatMessagesPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  SellerModel otherUser;
  String chatId;
  ChatMessagesPage(this.otherUser, this.chatId);
  createWidget(MessageModel messageMode) {
    bool isMe = !(messageMode.senderId == otherUser.sellerId);
    if (isMe) {
      return createMyMessage(messageMode);
    } else {
      return createFriendMessage(messageMode);
    }
  }

  Widget createMyMessage(MessageModel messageMode) {
    return ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 20),
      backGroundColor: Colors.blue,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(Get.context).size.width * 0.7,
        ),
        child: Text(messageMode.content),
      ),
    );
  }

  Widget createFriendMessage(MessageModel messageMode) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          child: Text(otherUser.userName[0].toUpperCase()),
        ),
        ChatBubble(
          clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 20),
          backGroundColor: Colors.red,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(Get.context).size.width * 0.7,
            ),
            child: Text(messageMode.content),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar:MyAppBar(
          title: 'الرسائل',
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: getChatMessages(chatId),
                      builder: (context, AsyncSnapshot<QuerySnapshot> dataSnapShot) {
                        Timer(
                            Duration(milliseconds: 100),
                                () => scrollController
                                .jumpTo(scrollController.position.maxScrollExtent));
                        if (dataSnapShot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (dataSnapShot.hasData) {
                          List<MessageModel> messages = dataSnapShot.data.docs
                              .map((e) => MessageModel.fromMap(e.data()))
                              .toList();

                          return ListView.builder(
                              controller: scrollController,
                              itemCount: messages.length,
                              itemBuilder: (context, index) {
                                return createWidget(messages[index]);
                              });
                        }
                        return Center(
                          child: Text('No Messages'),
                        );
                      }),
                )),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      onTap: () {},
                      decoration: InputDecoration(
                          hintText: 'Enter your message',
                          border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        DateTime dateTime = DateTime.now();
                        MessageModel messageMode = MessageModel(
                            content: controller.text,
                            senderId:Repository.repository.appUser.userId,
                            senderName: Repository.repository.appUser.userName,
                            timeStamp: FieldValue.serverTimestamp(),
                            date:
                            '${dateTime.year}-${dateTime.month}-${dateTime.day}',
                            time: '${dateTime.hour}:${dateTime.minute}',
                            chatId: chatId);
                        createMessage(messageMode);
                        Timer(
                            Duration(milliseconds: 100),
                                () => scrollController.jumpTo(
                                scrollController.position.maxScrollExtent));
                        // Timer(
                        //     Duration(milliseconds: 100),
                        //     () => scrollController.jumpTo(
                        //         scrollController.position.maxScrollExtent));
                        controller.clear();
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
