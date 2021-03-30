import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/2homeHead.dart';
import 'package:graduation_project/widgets/3homeTitle.dart';
import 'package:graduation_project/widgets/4product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //first item
              HomeHead(),
              //second item
              HomeTitle(
                text: "التصنيفات",
              ),
              Container(
                width: double.infinity,
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 8,
                  ),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      ExtendedNavigator.of(context).push(Routes.categories);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/cat${index + 1}.png',
                          fit: BoxFit.contain,
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('test ${index + 1}')
                      ],
                    ),
                  ),
                ),
              ),
              HomeTitle(
                text: "الأكثر شهرة",
                onTap: () {
                  ExtendedNavigator.of(context).push(
                    Routes.allProducts,
                    arguments: AllProductsArguments(title: "الأكثر شهرة"),
                  );
                },
              ),
              Container(
                width: double.infinity,
                height: 260.h,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 8,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => ProductWidget(
                    imageUrl: 'assets/images/test.png',
                    productName: 'أيفون 11',
                    productPrice: '60',
                  ),
                ),
              ),

              SizedBox(
                height: 16,
              ),
              HomeTitle(
                text: "منتجات جديدة",
                onTap: () {
                  ExtendedNavigator.of(context).push(
                    Routes.allProducts,
                    arguments: AllProductsArguments(title: "منتجات جديدة"),
                  );
                },
              ),
              Container(
                width: double.infinity,
                height: 260.h,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 8,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => ProductWidget(
                    imageUrl: 'assets/images/test.png',
                    productName: 'أيفون 11',
                    productPrice: '60',
                  ),
                ),
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