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
      is_student: map['is_student']
    );
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
