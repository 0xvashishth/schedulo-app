// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Updates extends StatefulWidget {
  const Updates({Key? key}) : super(key: key);

  @override
  _UpdatesState createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Updates'),
      // ),
      // backgroundColor: Colors.purple,
      body: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        height: 300,
        child: Carousel(
          images: [
            Image.network(
              'https://images.unsplash.com/photo-1506260408121-e353d10b87c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGlsbHN8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              scale: 1,
            ),
            Image.network(
              'https://images.unsplash.com/photo-1454942901704-3c44c11b2ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZyZWV8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              scale: 1,
            ),
            Image.network(
              'https://cdn.pixabay.com/photo/2022/01/19/00/36/sea-6948569__340.jpg',
              scale: 1,
            ),
            Image.network(
              'https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGZyZWV8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              scale: 1,
            ),
            Image.network(
              'https://images.unsplash.com/photo-1600938429558-df315f9b6338?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGZyZWV8ZW58MHwwfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              scale: 1,
            ),
          ],
          dotPosition: DotPosition.bottomRight,
          dotSize: 4,
          showIndicator: true,
          overlayShadow: false,
          radius: const Radius.circular(20),
          dotHorizontalPadding: 20,
          dotVerticalPadding: 20,
          dotBgColor: Colors.transparent,
          dotColor: Colors.black,
          borderRadius: true,
          boxFit: BoxFit.fill,
        ),
      ),
    );
  }
}
