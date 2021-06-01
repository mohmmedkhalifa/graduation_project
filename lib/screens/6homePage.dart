import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/backend/productProvider.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/2homeHead.dart';
import 'package:graduation_project/widgets/3homeTitle.dart';
import 'package:graduation_project/widgets/4product.dart';
import 'package:provider/provider.dart';

import '../const.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var productModel = Provider.of<ProductProvider>(context).allProducts;

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
                onTap: (){
                  ExtendedNavigator.of(context).push(Routes.categories);
                },
              ),
              Container(
                width: double.infinity,
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 8,
                  ),
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      ExtendedNavigator.of(context).push(Routes.allProducts,
                          arguments: AllProductsArguments(
                            title: categories[index],
                            productModel: productModel,
                          ));
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
                        Text(categories[index])
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
                  itemCount: productModel.length,
                  itemBuilder: (context, index) => ProductWidget(
                    onTap: (){
                      ExtendedNavigator.of(context).push(
                        Routes.productDetails,
                        arguments: ProductDetailsArguments(
                            productModel: productModel[index]
                        ),
                      );
                    },
                    imageUrl: productModel[index].imageUrl1,
                    productName: productModel[index].productName,
                    productPrice: productModel[index].productPrice,
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

// Widget web(context, Size size) {
//   return Directionality(
//     textDirection: TextDirection.rtl,
//     child: Scaffold(
//       backgroundColor: Color(0xffCFCCCC),
//       body: SingleChildScrollView(
//         child: Container(
//           width: size.width,
//           height: size.height,
//           child: Column(
//             children: [
//               /////first // App Bar
//               Container(
//                 color: Colors.blue,
//                 width: size.width,
//                 height: size.height * 85 / size.height,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 1,
//                       child: IconButton(
//                           icon: Icon(
//                             CupertinoIcons.profile_circled,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                           onPressed: () {}),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: IconButton(
//                         icon: Icon(
//                           CupertinoIcons.cart,
//                           size: 30,
//                           color: Colors.white,
//                         ),
//                         onPressed: () {},
//                         color: Colors.white,
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: IconButton(
//                           icon: Icon(
//                             CupertinoIcons.list_bullet,
//                             size: 30,
//                             color: Colors.white,
//                           ),
//                           onPressed: () {}),
//                     ),
//                     Expanded(
//                       flex: 5,
//                       child: MyTextField(
//                         labelText: 'البحث ...',
//                         lines: 1,
//                         icon: Icon(CupertinoIcons.search),
//                         keyboardType: TextInputType.text,
//                       ),
//                     ),
//                     Spacer(),
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Expanded(
//                           child: Text(
//                             'سوق غزة ',
//                             style: TextStyle(
//                                 fontSize: 60,
//                                 color: Color(0xffDFDFDF),
//                                 fontFamily: 'Kat'),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Expanded(
//                           child: Text(
//                             'للبضائع المستعملة',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Color(0xffDFDFDF),
//                                 fontFamily: 'Kat'),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       width: 80,
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: size.height * 28 / size.height,
//               ),
//               ///// second // home layout
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                   width: size.width,
//                   height: size.height * 622 / size.height,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: Container(
//                           height: size.height * 622 / size.height,
//                           width: size.width * 280 / size.width,
//                           margin: EdgeInsets.only(left: 24),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(16)),
//                           child: Column(
//                             children: [
//                               ListTile(
//                                 title: Text(
//                                   'التصنيفات',
//                                   style: TextStyle(fontSize: 30),
//                                 ),
//                                 trailing: Icon(
//                                   CupertinoIcons.list_bullet,
//                                   size: 24,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   height: size.height * 500 / size.height,
//                                   child: ListView.separated(
//                                     separatorBuilder: (context, index) =>
//                                         SizedBox(
//                                       height: 10,
//                                     ),
//                                     itemCount: categories.length,
//                                     itemBuilder: (context, index) =>
//                                         GestureDetector(
//                                       onTap: () {
//                                         ExtendedNavigator.of(context)
//                                             .push(Routes.categories);
//                                       },
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           Image.asset(
//                                             'assets/images/cat${index + 1}.png',
//                                             fit: BoxFit.contain,
//                                             width: 40,
//                                             height: 40,
//                                           ),
//                                           SizedBox(
//                                             height: 8,
//                                           ),
//                                           Text(
//                                             categories[index],
//                                             style: TextStyle(fontSize: 24),
//                                             textAlign: TextAlign.right,
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 3,
//                         child: Container(
//                           color: Colors.red,
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Container(
//                           height: size.height * 622 / size.height,
//                           width: size.width * 280 / size.width,
//                           margin: EdgeInsets.only(right: 24),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(16)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
