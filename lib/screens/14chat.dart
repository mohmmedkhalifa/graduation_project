import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/models/sellerModel.dart';
import 'package:graduation_project/widgets/5appBar.dart';

import '14.0chatMessages.dart';

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'المحادثات',
        ),
        body: Repository.repository.sellers.isEmpty
            ? Center(
                child: Text('No Users Found'),
              )
            : ListView.builder(
                itemCount: Repository.repository.sellers.length,
                itemBuilder: (context, index) {
                  return UserWidget(Repository.repository.sellers[index]);
                },
              ),
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  SellerModel userModel;

  UserWidget(this.userModel);

  @override
  Widget build(BuildContext context) {
    print(userModel.sellerId);
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: () async {
          String chatId = await createChat(
              [userModel.sellerId, Repository.repository.appUser.userId]);
          Get.to(ChatMessagesPage(userModel, chatId));
        },
        leading: CircleAvatar(
          radius: 30,
          child: Text(userModel.userName[0].toUpperCase()),
        ),
        title: Text(userModel.userName),
        subtitle: Text(userModel.email),
        trailing: Icon(Icons.chat_rounded),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:graduation_project/widgets/5appBar.dart';
//
// class Chat extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: MyAppBar(
//           title: 'الرسائل',
//         ),
//         body: ListView(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
//               child: Card(
//                 elevation: 6,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(36),
//                 ),
//                 shadowColor: Colors.blue,
//                 child: ListTile(
//                   leading: Image.asset('assets/images/cat4.png'),
//                   title: Text('علي حرب'),
//                   subtitle: Text('مرحبا محمود'),
//                   trailing: Text('10:30 '),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
