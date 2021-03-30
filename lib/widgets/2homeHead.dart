import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '1textField.dart';

class HomeHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
            bottomRight: Radius.circular(80),
          ),
          child: Image.asset(
            'assets/images/top.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 30,
            ),
            MyTextField(
              icon: Icon(CupertinoIcons.search),
              labelText: 'ابحث',
            ),
            SizedBox(
              height: 16,
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                initialPage: 0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              itemCount: 3,
              itemBuilder: (context, index, realIndex) =>
                  Image.asset('assets/images/slider1.png'),
            ),
          ],
        ),
      ],
    );
  }
}
