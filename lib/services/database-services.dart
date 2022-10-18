import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  late final String? uid;
  final db = FirebaseFirestore.instance;

  DatabaseService({this.uid});

  // FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // static final _auth = FirebaseAuth.instance;
  // User? user = _auth.currentUser;

  // get user type
  // Currently not in use
  Future<bool> getUserType() async {
    final Function setUserType;
    User? user = FirebaseAuth.instance.currentUser;
    uid = user!.uid;

    CollectionReference users = db.collection('users');

    Map<String, dynamic> data =
        (await users.doc(uid).get()).data() as Map<String, dynamic>;

    print("In getUserType");
    print(data['is_student']);

    return data['is_student'];
  }

  Future getUserName(uid) async {
    log("Form is_student");
    print(uid);
    var user_name = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      return value;
    });
    // print("hello");
    print("kk");
    print(user_name.email);
    print("jj");
    return user_name;
  }
}
