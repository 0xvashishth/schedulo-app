// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'userModals.dart';

class LectureModel {
  String? subject; //
  String? description;

  ///
  String? uid; ////
  String? department;

  ///
  String? sem;

  ///
  int? weekday;

  ///
  Timestamp? will_start_at;

  ///
  Timestamp? will_end_at;

  ///
  int? duration;

  ///
  String? TName;

  ///
  // UserModals userInstance;
  String? userInstance; ////

  // (this.will_end_at.hour * 60 + will_end_at.minute) * 60 - (will_start_at.hour * 60 + will_start_at.minute) * 60,
  LectureModel({
    this.subject,
    this.uid,
    this.description,
    this.department,
    this.sem,
    this.weekday,
    this.will_end_at,
    this.will_start_at,
    this.duration,
    this.userInstance,
    this.TName,
  });

  //data from server
  factory LectureModel.fromMap(map) {
    return LectureModel(
      subject: map['subject'],
      uid: map.id,
      description: map['description'],
      department: map['department'],
      sem: map['sem'],
      will_start_at: map['will_start_at'],
      will_end_at: map['will_end_at'],
      weekday: map['weekday'],
      duration: map['duration'],
      userInstance: map['userInstance'],
      TName: map["TName"],
    );
  }

  //sending to server
  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'description': description,
      'department': department,
      'sem': sem,
      'will_start_at': will_start_at,
      'will_end_at': will_end_at,
      'duration': duration,
      'weekday': weekday,
      'userInstance': userInstance,
      'TName': TName,
    };
  }
}
