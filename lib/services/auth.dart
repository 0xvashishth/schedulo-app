// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:schedulo/modals/userModals.dart';

class AuthService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;

  Future<void> updateUser(
      {String? uid,
      String? name,
      String? email,
      String? department,
      String? sem,
      bool? is_student}) async {
    UserModals loggedUser = UserModals(
        uid: uid,
        name: name,
        email: email,
        department: department,
        sem: sem,
        is_student: is_student);

    await _firestore.collection("users").doc(uid).set(loggedUser.toMap());
    Fluttertoast.showToast(msg: "User Updated");
  }
}
