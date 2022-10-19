class FacultyModel {
  int fid;
  String name;
  String email;
  String subject;
  String education;
  String contact;
  String image;
  // late final String department;

  FacultyModel({
    required this.fid,
    required this.name,
    required this.email,
    required this.subject,
    required this.education,
    required this.contact,
    required this.image,
    // this.department,
  });

  factory FacultyModel.fromJson(Map<String, dynamic> json) {
    return FacultyModel(
      fid: json['fid'],
      name: json['name'],
      email: json['email'],
      subject: json['subject'],
      education: json['education'],
      contact: json['contact'],
      image: json['image'],
      // department: map['department'],
    );
  }
}
