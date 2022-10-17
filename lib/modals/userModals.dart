class UserModals {
  String? name;
  String? email;
  String? uid;

  UserModals({this.name, this.uid, this.email});

  //data from server
  factory UserModals.fromMap(map) {
    return UserModals(
      name: map['name'],
      uid: map['uid'],
      email: map['email'],
    );
  }

  //sending to server
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'email': email,
    };
  }
}
