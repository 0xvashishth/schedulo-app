// ignore_for_file: prefer_const_constructors
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:schedulo/modals/lectureModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class AuthService {
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   static final _auth = FirebaseAuth.instance;
//   User? user = _auth.currentUser;

class LectureService {
  CollectionReference lecturesCollection =
      FirebaseFirestore.instance.collection("Lectures");

  Future createNewLecture(LectureModel lectureInstance) async {
    return await lecturesCollection.add(lectureInstance.toMap());
  }

  Future updateLecture(lid, LectureModel lectureInstance) async {
    await lecturesCollection.doc(lid).update(lectureInstance.toMap());
  }

  Future removeLecture(lid) async {
    await lecturesCollection.doc(lid).delete();
  }

  List<LectureModel> lectureFromFirestore(QuerySnapshot snapshot) {
    return snapshot.docs.map((map) {
      print(map);
      return LectureModel.fromMap(map);
    }).toList();
  }

  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     loggedUser = UserModals.fromMap(value.data());
  //     setState(() {
  //       loggedUser;
  //     });
  //   });
  // }

  Stream<List<LectureModel>> listLectures() {
    return lecturesCollection.snapshots().map(lectureFromFirestore);
  }
}
