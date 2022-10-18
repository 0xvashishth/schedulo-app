import 'package:cloud_firestore/cloud_firestore.dart';

class UserModals {
  String? name;
  String? email;
  String? uid;
  String? department;
  String? sem;
  // ignore: non_constant_identifier_names
  bool? is_student;

  UserModals(
      {this.name,
      this.uid,
      this.email,
      this.department,
      this.sem,
      // ignore: non_constant_identifier_names
      this.is_student});

  //data from server
  factory UserModals.fromMap(map) {
    return UserModals(
        name: map['name'],
        uid: map['uid'],
        email: map['email'],
        department: map['department'],
        sem: map['sem'],
        is_student: map['is_student']);
  }

  //sending to server
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'email': email,
      'department': department,
      'sem': sem,
      'is_student': is_student
    };
  }
}

class UserService {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  // Future createNewTodo(String title) async {
  //   return await todosCollection.add({
  //     "title": title,
  //     "isComplet": false,
  //   });
  // }

  // Future completTask(uid) async {
  //   await todosCollection.doc(uid).update({"isComplet": true});
  // }

  Future<Object> getUser(uid) async {
    DocumentSnapshot<Object?> users = await usersCollection.doc(uid).get();
    return users;
  }

  // String todoFromFirestore(String uid) {
  //   // return usersCollection.doc(uid).get();
  // }

  // List<Todo> todoFromFirestore(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((e) {
  //     return Todo(
  //       isComplet: e["isComplet"],
  //       title: e["title"],
  //       uid: e.id,
  //     );
  //   }).toList();
  // }

  // Stream<List<Todo>> listTodos() {
  //   return todosCollection.snapshots().map(todoFromFirestore);
  // }
}
