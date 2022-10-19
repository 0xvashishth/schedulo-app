// ignore_for_file: prefer_const_constructors
import 'package:schedulo/modals/lectureModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schedulo/modals/userModals.dart';

class UserService {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");
  UserModals um = UserModals();

  List<UserModals> userFromFirestore(QuerySnapshot snapshot) {
    return snapshot.docs.map((map) {
      print(map);
      return UserModals.fromMap(map);
    }).toList();
  }

  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');

  // Future<Map<String,dynamic>> getAllUsersData() async {
  //   // Get docs from collection reference
  //   Map<String, dynamic> listUsers;
  //   QuerySnapshot querySnapshot = await _collectionRef.get();
  //   var result =
  //       await FirebaseFirestore.instance.collection('users').get();

  //   result.forEach((eachResult) {
  //         listUsers = eachResult.data;
  //   });

  //   for( var values in result){
  //       print("Connected to second database and read ${values}");
  //       }

  //   print("Hello World");
  //   // Get data from docs and convert map to List
  //   // listUsers = querySnapshot.docs.map((doc) => doc.data());

  //   // print(allData);

  //   return listUsers;
  // }

  Future getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    List<UserModals> allData1 =
        querySnapshot.docs.map((doc) => UserModals.fromMap(doc)).toList();

    return allData1;
  }

  Future<List<UserModals>?> getAllUsers() async {
    print("Inside getAllUsers");
    try {
      // QuerySnapshot querySnapshot=await _collectionRef.doc(id).collection('users').get();
      print("Inside try");
      List<UserModals>? result;
      QuerySnapshot querySnapshot = await _collectionRef.get();
      print("Get Snapshot");
      result = querySnapshot.docs.map((map) {
        print(map);
        return UserModals.fromMap(map);
      }).toList();
      // querySnapshot.docs.forEach((doc) {
      //   print(doc["first_name"]);
      //   result!.add(UserModals.fromMap(doc.data()));
      // });
      print("After Loop");
      print(result);
      return result;
    } catch (error) {
      print(error);
      List<UserModals>? result;
      // return error.message;
      return result;
    }
  }

  // Stream<List<UserModals>> listUsers() {
  //   return usersCollection.snapshots().map(userFromFirestore);
  // }

  // Future userFormFirebase(String uid) async {
  //   // final ref = FirebaseFirestore.instance.collection('users').doc(uid);
  //   return usersCollection
  //       .doc(uid)
  //       .get()
  //       .then((s) => UserModals.fromMap(s.data()));
  // }
}
