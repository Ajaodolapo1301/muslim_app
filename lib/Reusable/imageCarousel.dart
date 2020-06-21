
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

Widget imageCarousel = Container(
    height: 250.0,
    child: Material(

      elevation: 5.0,
      child: Carousel(
          boxFit: BoxFit.cover,

          images: [

            AssetImage('images/product1.jpeg'),
            AssetImage("images/product2.jpeg"),
            AssetImage("images/product3.jpeg")
          ],
          autoplay: false,
          dotSize: 0,
          indicatorBgPadding: 0
      ),
    )
);