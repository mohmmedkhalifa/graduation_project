import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/backend/productProvider.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class AddProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        Provider.of<ProductProvider>(context, listen: false).productModel;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'تفاصيل الطلب',
        ),
        body: SingleChildScrollView(
          child: Column(
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
                    leading: Icon(Icons.info),
                    title: Text(
                      'معلومات المنتج',
                      style: TextStyle(color: Colors.blue),
                    ),
                    subtitle: Column(
                      children: [
                        ListTile(
                          title: Text('عنوان المنتج'),
                          trailing: Text(
                            productModel.productName,
                          ),
                        ),
                        ListTile(
                          title: Text('تاريخ الإضافة'),
                          trailing: Text(
                            '${productModel.date.toDate().hour}:${productModel.date.toDate().minute} -- ${productModel.date.toDate().day}/ ${productModel.date.toDate().month} / ${productModel.date.toDate().year}',
                          ),
                        ),
                        ListTile(
                          title: Text('سعر المنتج'),
                          trailing: Text('${productModel.productPrice} \₪'),
                        ),
                        ListTile(
                          title: Text('الكمية'),
                          trailing: Text('${productModel.productQuantity}'),
                        ),
                        ListTile(
                          title: Text('التصنيف'),
                          trailing: Text('${productModel.productCate}'),
                        ),
                        ListTile(
                          title: Text('الوصف'),
                          trailing: Text('''${productModel.productDesc}'''),
                        ),
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
                    leading: Icon(CupertinoIcons.photo),
                    title: Text(
                      'صور المنتج',
                      style: TextStyle(color: Colors.blue),
                    ),
                    subtitle: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: OctoImage(
                            image: CachedNetworkImageProvider(
                                productModel.imageUrl1 ?? ''),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                            ),
                            errorBuilder: OctoError.icon(color: Colors.red),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          child: OctoImage(
                            image: CachedNetworkImageProvider(
                                productModel.imageUrl2 ?? ''),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                            ),
                            errorBuilder: OctoError.icon(color: Colors.red),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 16,
              ),
              MyButton(
                buttonColor: Colors.blue,
                textColor: Colors.white,
                title: 'تأكيد',
                onPressed: () {
                  addProductToFireBase(productModel.toJson(), context);
                },
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
