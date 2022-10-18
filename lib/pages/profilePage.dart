import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schedulo/login/login.dart';
import 'package:schedulo/modals/userModals.dart';
import 'package:schedulo/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage1 extends StatefulWidget {
  const ProfilePage1({Key? key}) : super(key: key);

  @override
  State<ProfilePage1> createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModals loggedUser = UserModals();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    loggedUser.name ?? "Anonymous User",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     FloatingActionButton.extended(
                  //       onPressed: () {},
                  //       heroTag: 'follow',
                  //       elevation: 0,
                  //       label: const Text("Follow"),
                  //       icon: const Icon(Icons.person_add_alt_1),
                  //     ),
                  //     const SizedBox(width: 16.0),
                  //     FloatingActionButton.extended(
                  //       onPressed: () {},
                  //       heroTag: 'mesage',
                  //       elevation: 0,
                  //       backgroundColor: Colors.red,
                  //       label: const Text("Message"),
                  //       icon: const Icon(Icons.message_rounded),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      showData("Name", FontAwesomeIcons.user,
                          loggedUser.name ?? "Anonymous User"),
                      showData("Email", FontAwesomeIcons.envelope,
                          loggedUser.email ?? "Anonymous Email"),
                      showData("Semester", FontAwesomeIcons.table,
                          loggedUser.sem ?? "Anonymous Sem" " sem"),
                      showData("Department", FontAwesomeIcons.networkWired,
                          loggedUser.department ?? "Anonymous department"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.normal);

  Widget showData(String title, IconData ico, String s) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              ico,
              color: Color(0xff1976d2),
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              s,
              style: optionStyle,
            ),
          ],
        ),
      );
}

// class _ProfileInfoRow extends StatefulWidget {
//    _ProfileInfoRow({Key? key}) : super(key: key);

//   @override
//   State<_ProfileInfoRow> createState() => _ProfileInfoRowState();
// }

// class _ProfileInfoRowState extends State<_ProfileInfoRow> {
//   final List<ProfileInfoItem> _items =  [
//     ProfileInfoItem("Email", loggedUser.email),
//     ProfileInfoItem("Semester", 120),
//     ProfileInfoItem("Department", 200),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       constraints: const BoxConstraints(maxWidth: 400),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: _items
//             .map((item) => Expanded(
//                     child: Row(
//                   children: [
//                     if (_items.indexOf(item) != 0) const VerticalDivider(),
//                     Expanded(child: _singleItem(context, item)),
//                   ],
//                 )))
//             .toList(),
//       ),
//     );
//   }

//   Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               item.value.toString(),
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           Text(
//             item.title,
//             style: Theme.of(context).textTheme.caption,
//           )
//         ],
//       );
// }

// class ProfileInfoItem {
//   final String title;
//   final String value;
//   const ProfileInfoItem(this.title, this.value);
// }

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xff0043ba), Color(0xff006df1)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
