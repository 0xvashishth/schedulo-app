// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:schedulo/modals/lectureModel.dart';
import 'package:schedulo/modals/userModals.dart';
import 'package:schedulo/services/database-services.dart';
import 'package:schedulo/services/lecture-service.dart';
import 'package:schedulo/services/user-services.dart';
import 'timeCard.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

DateTime startdateTime = new DateTime.now();
DateTime enddateTime = new DateTime.now();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message ${message.messageId}");
}

class Updates extends StatefulWidget {
  const Updates({Key? key}) : super(key: key);

  @override
  _UpdatesState createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  // DatabaseService ds = DatabaseService();
  User? user = FirebaseAuth.instance.currentUser;
  String? user_token = " ";
  // User? user = FirebaseAuth.instance.currentUser;
  FlutterLocalNotificationsPlugin fnp = FlutterLocalNotificationsPlugin();
  bool? is_student = true;
  // UserService us = UserService();

  // final TextEditingController _todoController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _weekdayController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _facultyController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  bool isComplet = false;
  bool _switch = false;
  bool circular = false;

  initState() {
    super.initState();
    is_student = true;
    getUserType();
    getUserDeviceToken();
    requestPermission();
    // getToken();
    initInfo();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // us.userFormFirebase(user!.uid);
  }

  Future getUserDeviceToken() async {
    // print("Form student_branch");
    user_token = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      return value.data()!['Device_Token'];
    }) as String;
    print("User Token: ${user_token}");
    setState(() {});
    // print(is_student);
  }

  initInfo() {
    var androidInitialise =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    // var iOSInitialze = const IOSIniti
    var initializationSettingsIOS = new DarwinInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialise, iOS: initializationSettingsIOS);
    // var initializationSettings =
    //     InitializationSettings(android: androidInitialise);
    fnp.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("........onMessage........");
      print(
          "onMessage: ${message.notification?.title}/${message.notification?.body}");
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );

      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        'dbfood',
        'dbfood',
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        playSound: true,
      );
      NotificationDetails platformChannelSpecifics = NotificationDetails(
          android: androidNotificationDetails,
          iOS: const DarwinNotificationDetails());
      await fnp.show(0, message.notification?.title, message.notification?.body,
          platformChannelSpecifics,
          payload: message.data['title']);
    });
  }

  // void saveToken(String token) async {
  //   await FirebaseFirestore.instance.collection("User Token").doc("User1").set({
  //     'token': token,
  //   });
  // }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Granted");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("granted provisional");
    } else {
      print("denied");
    }
  }

  void sendPushNotification(String token, String subject, String Tname) async {
    try {
      print("Inside Push Notification");
      print(token + Tname + subject);
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAA9buc-3Y:APA91bF-C6ffgOtG7RCa3PrSE09oEAE94WMsGsvM7HV_3a1eoXdhp6mzOkJ2OOCYFNQwkAgCpBBntSgL7wd7vEOM-O2YT9zrRzZTKKiFv-6qdJX4rg58ZjFEERGtp2z2rEE-EeW_ktmS',
        },
        body: jsonEncode(
          <String, dynamic>{
            // print(object);
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': Tname,
              'title': subject,
            },
            "notification": <String, dynamic>{
              "title": subject,
              "body": Tname,
              "android_channel_id": "dbfood"
            },
            "to": token,
          },
        ),
      );
      print("Before Push Notification");
    } catch (e) {
      print(e);
    }
    print("After try catch Push Notification");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TimeTable'),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: timeCard(),
      ),

      floatingActionButton: !is_student!
          ? FloatingActionButton(
              onPressed: _fModalBottomSheet,
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add),
            )
          : Text(""),

      // Container(
      //   margin: EdgeInsets.only(top: 10, bottom: 10),
      //   // padding: EdgeInsets.all(20),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   height: 300,
      //   child: const timeCard(),
      // ),
    );
  }

  Future getUserType() async {
    log("Form is_student");
    is_student = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      return value.data()!['is_student'];
    }) as bool;
    setState(() {});
    // print(is_student);
  }

  void _fModalBottomSheet() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      ),
      backgroundColor: const Color(0xffd9d9d9),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(
              // bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
              height: 650,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 15,
                      margin: const EdgeInsets.only(top: 10, left: 6),
                      child: const Text("Add Lecture",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 254, 244, 244),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: _subjectController,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        decoration: InputDecoration(
                          // border: InputBorder.none,
                          prefixIcon: Icon(Icons.subject),
                          hintText: 'Subject Name',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: const Color(0xff50C4ED).withOpacity(0),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 254, 244, 244),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: _departmentController,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        decoration: InputDecoration(
                          // border: InputBorder.none,
                          prefixIcon: Icon(Icons.museum),
                          hintText: 'Department Name',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: const Color(0xff50C4ED).withOpacity(0),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 254, 244, 244),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: _semesterController,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        decoration: InputDecoration(
                          // border: InputBorder.none,
                          prefixIcon: Icon(Icons.format_list_numbered),
                          hintText: 'Semester No.',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: const Color(0xff50C4ED).withOpacity(0),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 254, 244, 244),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: _weekdayController,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        decoration: InputDecoration(
                          // border: InputBorder.none,
                          prefixIcon: Icon(Icons.calendar_view_day),
                          hintText: 'WeekDay No.(1-5)',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: const Color(0xff50C4ED).withOpacity(0),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 254, 244, 244),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: _durationController,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        decoration: InputDecoration(
                          // border: InputBorder.none,
                          prefixIcon: Icon(Icons.watch_later),
                          hintText: 'Duration In Hours',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: const Color(0xff50C4ED).withOpacity(0),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 254, 244, 244),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: _facultyController,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        decoration: InputDecoration(
                          // border: InputBorder.none,
                          prefixIcon: Icon(Icons.tag_faces),
                          hintText: 'Faculty Name',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: const Color(0xff50C4ED).withOpacity(0),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DatetimePickerWidget1(),
                    const SizedBox(
                      height: 10,
                    ),
                    DatetimePickerWidget2(),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0.0),
                        onPressed: () async {
                          setState(() {
                            circular = true;
                          });
                          try {
                            if (_semesterController.text.isNotEmpty &&
                                _facultyController.text.isNotEmpty &&
                                _departmentController.text.isNotEmpty &&
                                _subjectController.text.isNotEmpty &&
                                _weekdayController.text.isNotEmpty &&
                                _durationController.text.isNotEmpty) {
                              LectureModel lecture = new LectureModel();
                              lecture.subject = _subjectController.text.trim();
                              lecture.TName = _facultyController.text.trim();
                              lecture.department =
                                  _departmentController.text.trim();
                              lecture.duration =
                                  int.parse(_durationController.text.trim());
                              lecture.description = "This is sample one";
                              // User? user = FirebaseAuth.instance.currentUser;
                              // DocumentSnapshot snap = await FirebaseFirestore
                              //     .instance
                              //     .collection("User Token")
                              //     .doc("User1")
                              //     .get();
                              // String token = snap['token'];
                              // print(token);
                              String lname = lecture.subject as String;
                              String Tname = lecture.TName as String;
                              // UserModals loggedUser = UserModals();
                              lecture.userInstance = user!.uid;
                              lecture.sem = _semesterController.text.trim();
                              lecture.weekday =
                                  int.parse(_weekdayController.text.trim());
                              // DateTime dateTime = new DateTime.now();
                              DateTime currentPhoneDate =
                                  DateTime.now(); //DateTime

                              Timestamp startTimeStamp =
                                  Timestamp.fromDate(startdateTime);
                              Timestamp endTimeStamp =
                                  Timestamp.fromDate(enddateTime);
                              lecture.will_start_at = startTimeStamp;
                              lecture.will_end_at = endTimeStamp;

                              // FirebaseFirestore.instance
                              //       .collection("users")
                              //       .doc(user!.uid)
                              //       .get()
                              //       .then((value) {
                              //     loggedUser = UserModals.fromMap(value.data());}
                              // setState(() {
                              //   loggedUser;
                              // });

                              await LectureService().createNewLecture(lecture);
                              Navigator.pop(context);
                              UserService us = new UserService();
                              // print("Before List Get Called");
                              List<UserModals> objs =
                                  await us.getData() as List<UserModals>;
                              // print(objs);
                              // print("After List Get Called");
                              for (var abv in objs) {
                                String? token = abv.Device_Token;
                                if (abv.department ==
                                        _departmentController.text.trim() &&
                                    abv.sem ==
                                        _semesterController.text.trim()) {
                                  sendPushNotification(token!, lname, Tname);
                                }
                              }
                            }
                            setState(() {
                              circular = false;
                            });
                          } catch (e) {
                            final snackbar =
                                SnackBar(content: Text(e.toString()));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                            setState(() {
                              circular = false;
                            });
                          }
                          _weekdayController.clear();
                          _subjectController.clear();
                          _departmentController.clear();
                          _durationController.clear();
                          _facultyController.clear();
                          _semesterController.clear();
                        },
                        child: const Text(
                          "Add Lecture",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ]),
            ),
          ]),
        );
      },
    );
  }
}

class ButtonHeaderWidget extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onClicked;

  const ButtonHeaderWidget({
    Key? key,
    required this.title,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      text: text,
      onClicked: onClicked,
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(40),
          primary: Colors.white,
        ),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        onPressed: onClicked,
      );
}

class DatetimePickerWidget1 extends StatefulWidget {
  @override
  _DatetimePickerWidgetState1 createState() => _DatetimePickerWidgetState1();
}

class DatetimePickerWidget2 extends StatefulWidget {
  @override
  _DatetimePickerWidgetState2 createState() => _DatetimePickerWidgetState2();
}

class _DatetimePickerWidgetState2 extends State<DatetimePickerWidget2> {
  DateTime dateTime = new DateTime.now();
  DateTime dateTemp = new DateTime.now();
  var i = 0;
  String getText() {
    if (i == 0) {
      i++;
      return 'Ends With';
    } else {
      enddateTime =
          DateTime.parse((DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime)));
      return DateFormat('MM/dd/yyyy HH:mm:ss').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'DateTime',
        text: getText(),
        onClicked: () => pickDateTime(context),
      );

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    print(date);

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    DateTime now = DateTime.now();
    if (newDate == null) return now;

    return newDate;
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
          : initialTime,
    );
    TimeOfDay now = TimeOfDay.now();
    if (newTime == null) return now;

    return newTime;
  }
}

class _DatetimePickerWidgetState1 extends State<DatetimePickerWidget1> {
  DateTime dateTime = new DateTime.now();
  DateTime dateTemp = new DateTime.now();
  var i = 0;
  String getText() {
    if (i == 0) {
      i++;
      return 'Starts From';
    } else {
      startdateTime =
          DateTime.parse((DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime)));
      return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'DateTime',
        text: getText(),
        onClicked: () => pickDateTime(context),
      );

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    print(date);

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    DateTime now = DateTime.now();
    if (newDate == null) return now;

    return newDate;
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
          : initialTime,
    );
    TimeOfDay now = TimeOfDay.now();
    if (newTime == null) return now;

    return newTime;
  }
}
