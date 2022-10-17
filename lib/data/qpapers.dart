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
          buildCard('MST 1', 0, 'images/icons/sem1.png'),
          buildCard('MST 2', 1, 'images/icons/sem1.png'),
          buildCard('External', 2, 'images/icons/sem1.png'),
          buildCard('MST 1', 3, 'images/icons/sem2.png'),
          buildCard('MST 2', 4, 'images/icons/sem2.png'),
          buildCard('External', 5, 'images/icons/sem2.png'),
          buildCard('MST 1', 3, 'images/icons/sem3.png'),
          buildCard('MST 2', 4, 'images/icons/sem3.png'),
          buildCard('External', 5, 'images/icons/sem3.png'),
          buildCard('MST 1', 3, 'images/icons/sem4.png'),
          buildCard('MST 2', 4, 'images/icons/sem4.png'),
          buildCard('External', 5, 'images/icons/sem4.png'),
          buildCard('MST 1', 3, 'images/icons/sem5.png'),
          buildCard('MST 2', 4, 'images/icons/sem5.png'),
          buildCard('External', 5, 'images/icons/sem5.png'),
          buildCard('MST 1', 3, 'images/icons/sem6.png'),
          buildCard('MST 2', 4, 'images/icons/sem6.png'),
          buildCard('External', 5, 'images/icons/sem6.png'),
          buildCard('MST 1', 3, 'images/icons/sem7.png'),
          buildCard('MST 2', 4, 'images/icons/sem7.png'),
          buildCard('External', 5, 'images/icons/sem7.png'),
          buildCard('MST 1', 3, 'images/icons/sem8.png'),
          buildCard('MST 2', 4, 'images/icons/sem8.png'),
          buildCard('External', 5, 'images/icons/sem8.png'),
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
