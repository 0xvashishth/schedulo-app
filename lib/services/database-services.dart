import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  late final String? uid;
  DatabaseService({this.uid});
  final db = FirebaseFirestore.instance;
  // FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // static final _auth = FirebaseAuth.instance;
  // User? user = _auth.currentUser;

  // get user type
  Future<bool> getUserType() async {
    User? user = FirebaseAuth.instance.currentUser;
    uid = user!.uid;

    CollectionReference users = db.collection('users');

    Map<String, dynamic> data =
        (await users.doc(uid).get()).data() as Map<String, dynamic>;
    return data['is_student'];
  }
}
