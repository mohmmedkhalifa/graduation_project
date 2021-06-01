import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/backend/productProvider.dart';
import 'package:graduation_project/backend/repository.dart';
import 'package:graduation_project/backend/server.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:graduation_project/models/router.gr.dart';
import 'package:graduation_project/widgets/0button.dart';
import 'package:graduation_project/widgets/10dropMenu.dart';
import 'package:graduation_project/widgets/1textField.dart';
import 'package:graduation_project/widgets/5appBar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../const.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var formKey = GlobalKey<FormState>();

  String productName;
  String productDesc;
  String productPrice;
  String productQuantity;
  String productCate;
  String imageUrl1;

  String imageUrl2;
  ProductModel productModel;

  saveForm() async {
    bool validate = formKey.currentState.validate();
    if (validate) {
      formKey.currentState.save();
      productModel = ProductModel(
          imageUrl1: this.imageUrl1,
          imageUrl2: this.imageUrl2,
          productCate: this.productCate,
          productDesc: this.productDesc,
          productName: this.productName,
          productPrice: this.productPrice,
          productQuantity: this.productQuantity,
          date: Timestamp.now(),
          sellerID: Repository.repository.appUser.userId);
      Provider.of<ProductProvider>(context, listen: false).productModel =
          productModel;
      await ExtendedNavigator.of(context).push(
        Routes.addProductDetails,
      );
    } else {
      return;
    }
  }

  String validateProductName(String value) {
    if (value == null || value == '') {
      return '*حقل مطلوب';
    }
    if (value.length < 3) {
      return '*حقل مطلوب';
    }
  }

  saveProductName(String newValue) {
    productName = newValue;
  }

  String validateProductDesc(String value) {
    if (value == null || value == '') {
      return '*حقل مطلوب';
    }
    if (value.length < 10) {
      return '*حقل مطلوب';
    }
  }

  saveProductDesc(String newValue) {
    productDesc = newValue;
  }

  String validateProductPrice(String value) {
    if (value == null) {
      return '*حقل مطلوب';
    }
  }

  saveProductPrice(String newValue) {
    productPrice = newValue;
  }

  String validateProductQuan(String value) {
    if (value == null) {
      return '*حقل مطلوب';
    }
  }

  saveProductQuan(String newValue) {
    productQuantity = newValue;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'إضافة منتج',
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                MyTextField(
                  lines: 1,
                  labelText: 'اسم المنتج',
                  keyboardType: TextInputType.text,
                  validator: validateProductName,
                  onSaved: saveProductName,
                ),
                MyTextField(
                  lines: 3,
                  labelText: 'وصف المنتج',
                  keyboardType: TextInputType.text,
                  validator: validateProductDesc,
                  onSaved: saveProductDesc,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                        labelText: 'السعر',
                        keyboardType: TextInputType.number,
                        validator: validateProductPrice,
                        onSaved: saveProductPrice,
                      ),
                    ),
                    Expanded(
                      child: MyTextField(
                        labelText: 'الكمية',
                        keyboardType: TextInputType.number,
                        validator: validateProductQuan,
                        onSaved: saveProductQuan,
                      ),
                    ),
                  ],
                ),
                DropMenu(
                  myMenu: categories,
                  title: 'التصنيف',
                  dropValue: productCate,
                  onChanged: (c) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    this.productCate = c;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Selector<ProductProvider, File>(
                      builder: (context, value, child) => Container(
                        width: 145 / size.width * size.width,
                        height: 145 / size.height * size.height,
                        decoration: BoxDecoration(
                          color: Color(0xffDBCBCB),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.blue,
                                ),
                                onPressed: () async {
                                  PickedFile pickedFile = await ImagePicker()
                                      .getImage(source: ImageSource.gallery);
                                  File file = File(pickedFile.path);
                                  imageUrl1 = await uploadProductsImage(file);
                                  Provider.of<ProductProvider>(context,
                                          listen: false)
                                      .setFile1(file);
                                },
                              ),
                              Text(
                                'أضف صورة رئيسية',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                '''سيرى الناس هذه الصورة عند ظهور إعلانك
في نتائج البحث ''',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 8),
                              ),
                            ],
                          ),
                        ),
                      ),
                      selector: (x, y) {
                        return y.file1;
                      },
                    ),
                    Selector<ProductProvider, File>(
                        builder: (context, value, child) => DashedContainer(
                              child: Container(
                                width: 145 / size.width * size.width,
                                height: 145 / size.height * size.height,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Image.asset(
                                            'assets/icons/gallery.png'),
                                        onPressed: () async {
                                          PickedFile pickedFile =
                                              await ImagePicker().getImage(
                                                  source: ImageSource.gallery);
                                          File file = File(pickedFile.path);
                                          imageUrl2 =
                                              await uploadProductsImage(file);
                                          Provider.of<ProductProvider>(context,
                                                  listen: false)
                                              .setFile2(file);
                                        },
                                      ),
                                      Text(
                                        'أضف  صورة أخرى',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        '''قدم إعلانك بشكل أفضل للمشترين''',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 8),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              dashColor: Colors.black,
                              dashedLength: 10,
                              strokeWidth: 1,
                              borderRadius: 4,
                            ),
                        selector: (x, y) {
                          return y.file2;
                        })
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                MyButton(
                  title: 'إضافة المنتج',
                  onPressed: saveForm,
                  buttonColor: Colors.blue,
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
