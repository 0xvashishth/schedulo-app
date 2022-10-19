// ignore_for_file: non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'userModals.dart';
import 'package:intl/intl.dart';

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

  compareTo(LectureModel b) {
    // if (this.will_start_at. > b.will_start_at) {
    //   return true;
    // } else {
    //   return false;
    // }
    Timestamp? thisStamp = this.will_start_at;
    Timestamp? bStamp = b.will_start_at;
    // DateTime thisstarttime =
    // DateTime.fromMillisecondsSinceEpoch(thisStamp);

    DateTime thisDateTime = thisStamp!.toDate();
    int thishour = thisDateTime.hour;
    int thisminute = thisDateTime.minute;

    // String thisdatetime = DateFormat('hh:mm:ss').format(thisDateTime);
    // print(thisdatetime);

    DateTime bDateTime = bStamp!.toDate();
    int bhour = bDateTime.hour;
    int bminute = bDateTime.minute;

    // String bdatetime = DateFormat('hh:mm:ss').format(bDateTime);
    // print(bdatetime);

    int res;

    if (thishour > bhour) {
      res = 1;
    } else if (thishour == bhour) {
      if (thisminute > bhour) {
        res = 1;
      } else if (thisminute == bminute) {
        res = 0;
      } else {
        res = -1;
      }
    } else {
      res = -1;
    }

    // if (thisDateTime.isBefore(bDateTime)) {
    //   res = -1;
    // } else if (thisDateTime.isAtSameMomentAs(bDateTime)) {
    //   res = 0;
    // } else {
    //   res = 1;
    // }

    return res;
  }
}
