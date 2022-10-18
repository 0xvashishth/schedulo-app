import 'package:schedulo/modals/lectureModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schedulo/modals/userModals.dart';

class UserService {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  Future userFormFirebase(String uid) async {
    return usersCollection
        .doc(uid)
        .get()
        .then((s) => UserModals.fromMap(s.data()));
  }
}
