import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:octo_image/octo_image.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(
          title: Repository.repository.appUser.storeName,
        ),
        body: SingleChildScrollView(
          child: Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
