import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/backend/productProvider.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<ProductModel> products = Provider.of<ProductProvider>(context)
        .allProducts
        .where((element) =>
            element.sellerID == Repository.repository.appUser.userId).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(
          title: Repository.repository.appUser.storeName,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.3,
                child: OctoImage(
                  image: CachedNetworkImageProvider(
                      Repository.repository.appUser.logoUrl),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                  ),
                  errorBuilder: OctoError.icon(color: Colors.red),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'المنتجات',
                  style: TextStyle(fontSize: 26),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              products.length != 0
                  ? Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(products[index].productName),
                        ),
                      ),
                    )
                  : Center(
                      child: Text('لا يوجد منتجات ! حاول إضافة منتجات جديدة'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
