import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/backend/customerProvider.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/models/customerModel.dart';
import 'package:graduation_project/models/sellerModel.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:provider/provider.dart';

import '14.0chatMessages.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    List<CustomerModel> cutomers =
        Provider.of<CustomerProvider>(context).customerModel;
    // TODO: implement build
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'المحادثات',
        ),
        body: cutomers.isEmpty
            ? Center(
                child: Text('لا يوجد مستخدمين'),
              )
            : ListView.builder(
                itemCount: cutomers.length,
                itemBuilder: (context, index) {
                  return Repository.repository.appUser.userId !=
                      cutomers[index].customerId
                      ? UserWidget(cutomers[index])
                      : UserWidget(cutomers[index]);
                },
              ),
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  CustomerModel userModel;

  UserWidget(this.userModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: () async {
          upadteChatWithUsers(Repository.repository.appUser.userId);
          Get.to(
              ChatScreen(Repository.repository.appUser.userId,
                  userModel.customerId, Repository.repository.appUser.userName));
          //Get.to(ChatMessagesPage(userModel, chatId));
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
