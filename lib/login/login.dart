// ignore_for_file: deprecated_member_use

import 'package:schedulo/login/forgotpassword.dart';
import 'package:schedulo/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPass = GlobalKey<FormState>();

  //key for form
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        onPressed: () async {
          await signIn(emailController.text, passController.text);
        },
        child: const Text(
          "Sign In",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: const CircleAvatar(
                foregroundImage: AssetImage('images/icons/splashScreen.png'),
                radius: 60,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: const Text(
                'Proceed with your',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: const Text(
                'Login ',
                style: TextStyle(fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKeyEmail,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(FontAwesomeIcons.user),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Email";
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    // return null;
                  },
                  // onSaved: (value) {
                  //   emailController.text = value!;
                  // },
                  textInputAction: TextInputAction.next,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKeyPass,
                child: TextFormField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(FontAwesomeIcons.key),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    RegExp regExp = RegExp(r'^.{6,10}$');
                    if (value!.isEmpty) {
                      return ("Required Password");
                    }
                    if (!regExp.hasMatch(value)) {
                      return ("Please Enter Min. 6 Characters and Max. 10");
                    }
                  },
                  autofocus: false,
                  onSaved: (value) {
                    passController.text = value!;
                  },
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
            Center(
              child: signUpButton,
            ),
            // Container(
            //   alignment: Alignment.center,
            //   child: GestureDetector(
            //     onTap: () {
            //       setState(() async {
            //         await signIn(emailController.text, passController.text);
            //       });
            //     },
            //     child: Padding(
            //       padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            //       child: Text(
            //         'Sign In',
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.forgotpasswordRoute);
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('New User?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.signupRoute);
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  //login function
  Future<void> signIn(String email, String password) async {
    try {
      if (_formKeyEmail.currentState!.validate() &&
          _formKeyPass.currentState!.validate()) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: 'Login Successful'),
                  Navigator.pushNamed(context, MyRoutes.homeRoute),
                });
      }
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: 'Failed With Error Code: ${error.code}');
      Fluttertoast.showToast(msg: email.toString() + " " + password.toString());
      Fluttertoast.showToast(msg: error.toString());
      print(error.toString());
    }
  }
}
