// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class LectureModel {
  String? subject;
  String? description;
  String? qid;
  String? department;
  String? sem;
  int? weekday;
  TimeOfDay? will_start_at;
  TimeOfDay? will_end_at;
  int? duration;
  // (this.will_end_at.hour * 60 + will_end_at.minute) * 60 - (will_start_at.hour * 60 + will_start_at.minute) * 60,
  LectureModel({
    this.subject,
    this.qid,
    this.description,
    this.department,
    this.sem,
    this.weekday,
    this.will_end_at,
    this.will_start_at,
    this.duration,
  });

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
      weekday: map['weekday'],
      duration: map['duration'],
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
      'will_end_at': will_end_at,
      'duration': duration,
      'weekday': weekday,
    };
  }
}
