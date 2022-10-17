import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schedulo/login/login.dart';
import 'package:schedulo/modals/userModals.dart';
import 'package:schedulo/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModals loggedUser = UserModals();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedUser = UserModals.fromMap(value.data());
      setState(() {
        loggedUser;
      });
    });
  }

  // String name = "{$loggedUser.name}";
  // String urn = '190280118';
  // String branch = 'CSE';
  // String batch = '2019';
  static const TextStyle optionStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.normal);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF5F5F5),
        // title: const Text('Profile'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                // signOff();
                logout(context);
                Navigator.pushNamed(context, MyRoutes.loginRoute);
              });
            },
            child: const Text(
              'LOGOUT',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            buildPro(),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  showData(FontAwesomeIcons.user,
                      loggedUser.name ?? "Anonymous User"),
                  showData(FontAwesomeIcons.envelope,
                      loggedUser.email ?? "Anonymous Email"),
                  showData(FontAwesomeIcons.table,
                      loggedUser.sem ?? "Anonymous Sem" " sem"),
                  showData(FontAwesomeIcons.networkWired,
                      loggedUser.department ?? "Anonymous department"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPro() => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueGrey,
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/icons/naruto.png'),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );

  Widget showData(IconData ico, String s) => Container(
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

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }
}
