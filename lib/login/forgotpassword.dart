// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget buildForm() => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: TextFormField(
              // obscureText: true,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.mail),
                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Email";
                }
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return "Enter a valid email";
                }
                return null;
              },
              onSaved: (value) {
                emailController.text = value!;
              },
              autofocus: false,
              textInputAction: TextInputAction.done,
            ),
          ),
        );

    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        onPressed: () async {
          String email = emailController.text;
          print("Here");
          print(email);
          final _auth = FirebaseAuth.instance;
          await _auth.sendPasswordResetEmail(email: email);

          // final user = FirebaseAuth.instance.currentUser;
          // await user?.sendEmailVerification();
          Navigator.of(context).pop();
        },
        child: Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blueAccent),
          onPressed: () async {
            // passing this to our root
            // final user = FirebaseAuth.instance.currentUser;
            // await user?.sendEmailVerification();
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              child: Image.asset('images/image/forget.png'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(16),
              child: Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            buildForm(),
            Center(child: signUpButton),
            // InkWell(
            //   splashColor: Colors.pink,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: Icon(FontAwesomeIcons.arrowRight),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
