class LectureModel {
  String? subject;
  String? description;
  String? qid;
  String? department;
  String? sem;
  final DateTime? will_start_at;
  final DateTime? will_end_at;
  final Duration? recurringInterval;

  LectureModel(
      {
        this.subject,
        this.qid,
        this.description,
        this.department,
        this.sem,
        this.will_end_at,
        this.will_start_at
      }
      );

  //data from server
  factory LectureModel.fromMap(map) {
    return LectureModel(
      subject: map['subject'],
      qid: map['qid'],
      description: map['description'],
      department: map['department'],
      sem: map['sem'],
      will_start_at: map['will_start_at'],
      will_end_at: map['will_end_at'],
    );
  }

  //sending to server
  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'qid': qid,
      'description': description,
      'department': department,
      'sem': sem,
      'will_start_at': will_start_at,
      'will_end_at': will_end_at
    };
  }
}
