import 'package:schedulo/metadata/question.dart';
import 'package:flutter/material.dart';
import 'package:schedulo/utils/routes.dart';

class QPapers extends StatefulWidget {
  const QPapers({Key? key}) : super(key: key);

  @override
  _QPapersState createState() => _QPapersState();
}

class _QPapersState extends State<QPapers> {
  static ApiService ql = new ApiService();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question Papers'),
      ),
      // backgroundColor: Colors.amber,
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          buildCard('CSE', 0, 'images/icons/sem1.png'),
          buildCard('CSE', 1, 'images/icons/sem2.png'),
          buildCard('CSE', 0, 'images/icons/sem3.png'),
          buildCard('CSE', 0, 'images/icons/sem4.png'),
          buildCard('CE', 0, 'images/icons/sem5.png'),
          buildCard('CE', 0, 'images/icons/sem6.png'),
          buildCard('IT', 1, 'images/icons/sem1.png'),
          buildCard('IT', 1, 'images/icons/sem2.png'),
          buildCard('IT', 1, 'images/icons/sem3.png'),
          buildCard('IT', 0, 'images/icons/sem4.png'),
          buildCard('CHE', 1, 'images/icons/sem1.png'),
          buildCard('CHE', 0, 'images/icons/sem2.png'),
          buildCard('ME', 1, 'images/icons/sem8.png'),
          buildCard('ME', 0, 'images/icons/sem8.png'),
        ],
      ),
    );
  }

  Widget buildDiv(String s) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.purple,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              s,
              style: TextStyle(fontSize: 35),
            ),
          ],
        ),
        height: 50,
        width: double.infinity,
      );

  Widget buildCard(String s, int num, String img) => GestureDetector(
        onTap: () {
          setState(() {
            ApiService.link(num);
            Navigator.pushNamed(context, MyRoutes.questionRoute);
          });
        },
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: 30,
          width: 30,
          child: Stack(
            children: [
              Center(
                child: Image(
                  image: AssetImage(img),
                ),
              ),
              Center(
                child: Text(
                  s,
                  style: TextStyle(fontSize: 30, fontFamily: 'Lato'),
                ),
              ),
            ],
          ),
        ),
      );
}
