// ignore_for_file: prefer_const_constructors
import 'package:schedulo/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final double cardHeight = 150;
  final double sBox = 20;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.normal);
  static const TextStyle optionStyle1 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Lato');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.only(
          //     // bottom: MediaQuery.of(context).viewInsets.bottom,
          //     ),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Information',
                style: optionStyle,
              ),
              buildCard1(),
              SizedBox(
                height: sBox,
              ),
              Text(
                'Department',
                style: optionStyle,
              ),
              buildCard2(),
              SizedBox(
                height: sBox,
              ),
              Text(
                'Resources',
                style: optionStyle,
              ),
              buildCard3(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard1() => Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        width: double.infinity,
        height: cardHeight,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, MyRoutes.booksRoute);
                  });
                },
                child: buildCon(
                  FontAwesomeIcons.book,
                  'Books',
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, MyRoutes.calculatorRoute);
                  });
                },
                child: buildCon(
                  FontAwesomeIcons.calculator,
                  'Calculator',
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, MyRoutes.eventsRoute);
                  });
                },
                child: buildCon(
                  FontAwesomeIcons.firefox,
                  'Events',
                ),
              ),
            ],
          ),
        ),
      );
  Widget buildCard2() => Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        width: double.infinity,
        height: cardHeight,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, MyRoutes.facultyRoute);
                  });
                },
                child: buildCon(
                  FontAwesomeIcons.graduationCap,
                  'Faculty',
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, MyRoutes.calenderRoute);
                  });
                },
                child: buildCon(
                  FontAwesomeIcons.calendar,
                  'Calender',
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, MyRoutes.syllabusRoute);
                  });
                },
                child: buildCon(
                  FontAwesomeIcons.yelp,
                  'Syllabus',
                ),
              ),
            ],
          ),
        ),
      );
  Widget buildCard3() => Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        width: double.infinity,
        height: cardHeight,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, MyRoutes.qpapersRoute);
                  });
                },
                child: buildCon(
                  FontAwesomeIcons.quora,
                  'QPapers',
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, MyRoutes.faqRoute);
                  });
                },
                child: buildCon(
                  FontAwesomeIcons.question,
                  'FAQ',
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, MyRoutes.halloffame);
                  });
                },
                child: buildCon(
                  FontAwesomeIcons.microphone,
                  'HOF',
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildCon(IconData ico1, String name1) => Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              ico1,
              size: 40,
              color: Color(0xff1976d2),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name1,
              style: optionStyle1,
            ),
          ],
        ),
        width: 100,
        height: 100,
      );
}
