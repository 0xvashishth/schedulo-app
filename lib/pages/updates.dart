// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'timeCard.dart';

class Updates extends StatefulWidget {
  const Updates({Key? key}) : super(key: key);

  @override
  _UpdatesState createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Updates'),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: const timeCard(),
      // Container(
      //   margin: EdgeInsets.only(top: 10, bottom: 10),
      //   // padding: EdgeInsets.all(20),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   height: 300,
      //   child: const timeCard(),
      // ),
    );
  }
}
