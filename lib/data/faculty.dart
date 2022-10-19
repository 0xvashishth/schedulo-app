// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedulo/services/faculty-service.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../modals/facultyModel.dart';

class Faculty extends StatefulWidget {
  const Faculty({Key? key}) : super(key: key);

  @override
  _FacultyState createState() => _FacultyState();
}

class _FacultyState extends State<Faculty> {
  // final String url = 'https://www.mrsptu.ac.in/faculty.php?did=8';

  static const TextStyle optionStyle =
      TextStyle(fontSize: 40, fontWeight: FontWeight.normal);

  static const TextStyle optionStyle2 =
      TextStyle(fontWeight: FontWeight.normal);

  final double cardHeight = 200;
  FacultyService fs = new FacultyService();

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty'),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '  Professors',
            style: optionStyle,
          ),
          buildContainer1(),
          // SizedBox(
          //   height: 10,
          // ),
          Text(
            '  Asst. Professors',
            style: optionStyle,
          ),
          buildContainer1(),
        ],
      ),
    );
  }

  Widget buildCard(String name, String qualification, String contact,
          String info, String url) =>
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        // color: Colors.blue,
        margin: EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'images/image/load.gif',
                      width: 160,
                      height: 180,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    width: 160,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FadeInImage.memoryNetwork(
                      fadeInDuration: Duration(milliseconds: 500),
                      placeholder: kTransparentImage,
                      image: url,
                      width: 160,
                      height: 180,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.all(5),
                width: 120,
                child: Text(
                  name + "\n" + qualification + "\n" + info + "\n" + contact,
                  style: optionStyle2,
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildContainer1() => FutureBuilder(
        future: fs.getFaculty(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
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
                  children: <Widget>[
                    for (FacultyModel fac in snapshot.data!)
                      buildCard(fac.name, fac.education, fac.contact, fac.email,
                          fac.image),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        // initialData: [],
      );

  // Widget buildContainer2() => Container(
  //       margin: EdgeInsets.only(left: 5),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(10),
  //           bottomRight: Radius.circular(10),
  //         ),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.5),
  //             spreadRadius: 5,
  //             blurRadius: 7,
  //             offset: Offset(0, 2),
  //           ),
  //         ],
  //       ),
  //       width: double.infinity,
  //       height: cardHeight,
  //       child: SingleChildScrollView(
  //         scrollDirection: Axis.horizontal,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             buildCard(
  //                 'Dr. Abhilasha',
  //                 'Ph.D',
  //                 '9417941071',
  //                 'Wireless Sensor Networks,\nDigital Image Processing\nMachine Learning.',
  //                 'https://www.mrsptu.ac.in/uploads/faculty/8/abhilasha.JPG'),
  //             buildCard(
  //                 'Er. Swati Jindal',
  //                 'M.Tech',
  //                 '9988249912',
  //                 'Networking\nMachine Learning',
  //                 'https://www.mrsptu.ac.in/uploads/faculty/8/swati_PIC.jpg'),
  //             buildCard(
  //                 'Er. Navdeep Kaur K.',
  //                 'M.Tech',
  //                 '9814637427',
  //                 'Cloud Computing',
  //                 'https://www.mrsptu.ac.in/uploads/faculty/8/navdeep.jpg'),
  //             buildCard(
  //                 'Er. Shipra',
  //                 'M.Tech',
  //                 '9780800012',
  //                 'Wireless Sensor Networks',
  //                 'https://www.mrsptu.ac.in/uploads/faculty/8/shipra.png'),
  //             buildCard(
  //                 'Er. Parul Garg',
  //                 'M.Tech',
  //                 '7307036333',
  //                 'Underwater Wireless Sensor Networks',
  //                 'https://www.mrsptu.ac.in/uploads/faculty/8/parul.jpg'),
  //             buildCard('Er. Simardeep', 'M.Tech', 'Networking', '9646419402',
  //                 'https://www.mrsptu.ac.in/uploads/faculty/8/simar.jpg'),
  //             buildCard(
  //                 'Er. Manpreet Sidhu',
  //                 'M.Tech',
  //                 '9646059265',
  //                 'Wireless Sensor Networks',
  //                 'https://mrsptu.ac.in/tpo/Er.%20Manpreet%20Sidhu.jpeg'),
  //           ],
  //         ),
  //       ),
  //     );

}
