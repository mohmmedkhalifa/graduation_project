import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/backend/addressProvider.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/models/addressModel.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  int totalPrice;

  Payment({this.totalPrice});

  @override
  _PaymentState createState() => _PaymentState();
}

enum PaymentMethod { byHand, jawwalPay }

class _PaymentState extends State<Payment> {
  PaymentMethod payment = PaymentMethod.byHand;

  @override
  void initState() {
    // TODO: implement initState
    getAllAddresses(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<AddressModel> address = Provider.of<AddressProvider>(context)
        .addresses
        .where((element) =>
            element.customerId == Repository.repository.appUser.userId)
        .toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(title: 'الدفع'),
        body: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: Colors.grey[200],
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadowColor: Colors.blue,
                child: ListTile(
                  leading: Icon(Icons.location_pin),
                  title: Text(
                    'العنوان',
                    style: TextStyle(color: Colors.blue),
                  ),
                  subtitle: address.length == 0
                      ? FittedBox(
                          child: Text('قم بإضافة عنوان بالضغط على السهم'))
                      : Text(
                          '${address.first.city} - ${address.first.address}'),
                  trailing: IconButton(
                    onPressed: () {
                      ExtendedNavigator.of(context).push(Routes.addAddress);
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: Colors.grey[200],
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadowColor: Colors.blue,
                child: ListTile(
                  leading: Icon(Icons.payment),
                  title: Text(
                    'اختر طريقة الدفع',
                    style: TextStyle(color: Colors.blue),
                  ),
                  subtitle: Column(
                    children: [
                      ListTile(
                        title: const Text('الدفع عند الاستلام'),
                        leading: Radio(
                          value: PaymentMethod.byHand,
                          groupValue: payment,
                          onChanged: (value) {
                            setState(() {
                              payment = value;
                            });
                          },
                        ),
                      ),
                      // ListTile(
                      //   title: const Text('جوال باي'),
                      //   leading: Radio(
                      //     value: PaymentMethod.jawwalPay,
                      //     groupValue: payment,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         payment = value;
                      //       });
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: Colors.grey[200],
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadowColor: Colors.blue,
                child: ListTile(
                  leading: Icon(Icons.description_outlined),
                  title: Text(
                    'تفاصيل الطلب',
                    style: TextStyle(color: Colors.blue),
                  ),
                  subtitle: Column(
                    children: [
                      ListTile(
                        title: Text('الإجمالي'),
                        trailing: Text('${widget.totalPrice} \₪'),
                      ),
                      ListTile(
                        title: Text('الخصم'),
                        trailing: Text('0 \₪'),
                      ),
                      ListTile(
                        title: Text('الإجمالي الكلي'),
                        trailing: Text('${widget.totalPrice} \₪'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16 * 3.0,
            ),
            MyButton(
              title: 'تأكيد',
              onPressed: () async{
                // String chatId = await createChat(
                //     [userModel.sellerId, Repository.repository.appUser.userId]);
                // ExtendedNavigator.of(context).push(Routes.chatMessagesPage,
                //     arguments: ChatMessagesPageArguments(
                //         otherUser: otherUser, chatId: chatId));


              },
              buttonColor: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
