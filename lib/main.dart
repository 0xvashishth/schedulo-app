import 'package:schedulo/data/calculator.dart';
import 'package:schedulo/data/faq.dart';
import 'package:schedulo/data/halloffame.dart';
import 'package:schedulo/data/library.dart';
import 'package:schedulo/data/qpapers.dart';
import 'package:schedulo/data/syllabus.dart';
import 'package:schedulo/login/forgotpassword.dart';
import 'package:schedulo/login/login.dart';
import 'package:schedulo/login/signup.dart';
import 'package:schedulo/metadata/question.dart';
import 'package:schedulo/utils/routes.dart';
import 'package:schedulo/pages/dashBoard.dart';
import 'package:schedulo/pages/updates.dart';
import 'package:schedulo/pages/profile.dart';
import 'package:schedulo/pages/homePage.dart';
import 'package:schedulo/data/faculty.dart';
import 'package:schedulo/data/calender.dart';
import 'package:schedulo/data/events.dart';
import 'package:schedulo/data/books.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'latoTextTheme',
        primaryColor: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.cyanAccent.shade400,
        ),
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      initialRoute: "/login",
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.dashBoardRoute: (context) => DashBoard(),
        MyRoutes.updatesRoute: (context) => Updates(),
        MyRoutes.profileRoute: (context) => Profile(),
        MyRoutes.calenderRoute: (context) => Calender(),
        MyRoutes.eventsRoute: (context) => Events(),
        MyRoutes.facultyRoute: (context) => Faculty(),
        MyRoutes.faqRoute: (context) => Faq(),
        MyRoutes.halloffame: (context) => HallOfFame(),
        MyRoutes.libraryRoute: (context) => Library(),
        MyRoutes.qpapersRoute: (context) => QPapers(),
        MyRoutes.syllabusRoute: (context) => Syllabus(),
        MyRoutes.calculatorRoute: (context) => Calculator(),
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.signupRoute: (context) => SignUp(),
        MyRoutes.forgotpasswordRoute: (context) => ForgotPassword(),
        MyRoutes.questionRoute: (context) => Question(),
        MyRoutes.booksRoute: (context) => Books(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    // ignore: unnecessary_null_comparison
    if (firebaseUser != null) {
      return const HomePage();
    }
    return const Login();
  }
}
//flutter run --no-sound-null-safety