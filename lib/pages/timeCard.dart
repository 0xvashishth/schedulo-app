import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedulo/modals/userModals.dart';
import 'package:schedulo/services/lecture-service.dart';
import 'package:schedulo/modals/lectureModel.dart';
import 'package:intl/intl.dart';

import '../services/database-services.dart';
import '../widget/datetime_picker.dart';

class timeCard extends StatefulWidget {
  const timeCard({key});

  @override
  State<timeCard> createState() => _timeCardState();
}

class _timeCardState extends State<timeCard> {
  // var TName = "";
  // initState() {
  //   super.initState();
  //   // is_student = true;
  //   // getUserType();
  //   TName = "";
  // }

  @override
  // var key = UserService.getUser("dsds");
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            // Spacer(),
            // Center(child: ElevatedCardExample()),
            StreamBuilder<List<LectureModel>>(
              stream: LectureService().listLectures(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  print(snapshot.hasData);
                  log("Hello");
                  return const CircularProgressIndicator(
                    color: Colors.black,
                  );
                }
                List<LectureModel>? tInstance = snapshot.data;
                return SizedBox(
                  height: 600,
                  width: MediaQuery.of(context).size.height,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey[800],
                    ),
                    itemCount: tInstance!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // DatabaseService ds = new DatabaseService();
                      // String TName = FirebaseFirestore.instance
                      //     .collection('users')
                      //     .doc(tInstance[index].userInstance)
                      //     .get()
                      //     .then((value) {
                      //   return value.data()?['name'];
                      // }) as String;
                      // print(TName);
                      // var ttest = ds.getUserName(tInstance[index].userInstance);
                      // print(ttest);
                      // print("hjhj");
                      // setState(() {});

                      // print(TName + "he");
                      // getName();
                      // print(TName);
                      String Tname = tInstance[index].TName ?? "";
                      var duration = tInstance[index].duration.toString();
                      var textsubtitle = Tname + " : " + duration + " hours";
                      var starting = tInstance[index].will_start_at!.toDate();
                      String formattedStartTime =
                          DateFormat.Hms().format(starting);
                      var ending = tInstance[index].will_end_at!.toDate();
                      String formattedEndTime =
                          DateFormat.Hms().format(starting);
                      final format = DateFormat.jm();
                      var formattedending = format.format(ending);
                      var formattedstarting = format.format(starting);
                      String timetotal =
                          formattedstarting + " To " + formattedending;

                      return Container(
                        height: 130,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 3,
                            color: const Color.fromARGB(255, 244, 244, 244),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.school_sharp),
                                  title: Text(tInstance[index].subject ?? ""),
                                  subtitle: Text(textsubtitle),
                                ),
                                // Text(todos[index].department ?? ""),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    // TextButton(
                                    //   child: const Text('BUY TICKETS'),
                                    //   onPressed: () {/* ... */},
                                    // ),
                                    // ignore: prefer_const_constructors
                                    Text(
                                      timetotal,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 123, 123, 123)),
                                    ),
                                    // const SizedBox(width: 8),
                                    // TextButton(
                                    //   child: const Text('LISTEN'),
                                    //   onPressed: () {/* ... */},
                                    // ),
                                    const SizedBox(
                                      width: 10,
                                      // height: 10,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  // width: 10,
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class OutlinedCardExample extends StatelessWidget {
//   const OutlinedCardExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         // elevation: 100,
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             color: Theme.of(context).colorScheme.outline,
//             // color: Colors.red,
//           ),
//           borderRadius: const BorderRadius.all(Radius.circular(12)),
//         ),
//         child: const SizedBox(
//           width: 300,
//           height: 100,
//           child: Center(child: Text('Outlined Card')),
//         ),
//       ),
//     );
//   }
// }

// class FilledCardExample extends StatelessWidget {
//   const FilledCardExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         elevation: 0,
//         color: Theme.of(context).colorScheme.surfaceVariant,
//         child: const SizedBox(
//           width: 300,
//           height: 100,
//           child: Center(child: Text('Filled Card')),
//         ),
//       ),
//     );
//   }
// }

class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 3,
          color: const Color.fromARGB(255, 244, 244, 244),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.school_sharp),
                title: Text('CE Sem-5 : Advance Technology'),
                subtitle: Text('Prof. Jignesh Sir : 1 hour'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  // TextButton(
                  //   child: const Text('BUY TICKETS'),
                  //   onPressed: () {/* ... */},
                  // ),
                  // ignore: prefer_const_constructors
                  Text(
                    "9:00 AM to 10:00 AM",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 123, 123, 123)),
                  ),
                  // const SizedBox(width: 8),
                  // TextButton(
                  //   child: const Text('LISTEN'),
                  //   onPressed: () {/* ... */},
                  // ),
                  const SizedBox(
                    width: 10,
                    // height: 10,
                  ),
                ],
              ),
              const SizedBox(
                // width: 10,
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
    // return Card(
    //   elevation: 2,
    //   color: Color.fromARGB(255, 228, 245, 253),
    //   child: InkWell(
    //     splashColor: Color.fromARGB(255, 7, 133, 235).withAlpha(30),
    //     onTap: () {
    //       debugPrint('Card tapped.');
    //     },
    //     child: SizedBox(
    //       width: 300,
    //       height: 100,
    //       child: Center(
    //         child: Text('Elevated Card'),
    //       ),
    //     ),
    //   ),
    // );
  }
}
