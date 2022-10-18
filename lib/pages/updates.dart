// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:schedulo/services/database-services.dart';

import 'timeCard.dart';

class Updates extends StatefulWidget {
  const Updates({Key? key}) : super(key: key);

  @override
  _UpdatesState createState() => _UpdatesState();
}

bool is_student = true;

class _UpdatesState extends State<Updates> {
  DatabaseService ds = DatabaseService();

  void initState() {
    super.initState();
    DatabaseService ds = DatabaseService();
    is_student = ds.getUserType() as bool;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Updates'),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: timeCard(),
      ),

      floatingActionButton: !is_student
          ? FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.navigation),
            )
          : Text("Not Student"),

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
