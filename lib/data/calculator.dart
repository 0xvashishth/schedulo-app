import 'package:schedulo/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  var lecDone = 0;
  var lecLeft = 0;
  var lecTotal = 0;
  var result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 300,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildForm1('Lecture Done'),
                    buildForm2('Lecture Left'),
                    buildForm3('Total Lecture')
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 300,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          res(lecDone, lecLeft, lecTotal);
                          buildAlert(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return buildAlert(context);
                            },
                          );
                        });
                      },
                      child: Text('Calcualte'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildForm1(String s) => Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 100,
        height: 80,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    fillColor: Colors.white70),
                onChanged: (value) {
                  setState(() {
                    lecDone = int.parse(value);
                  });
                },
              ),
            ),
            FittedBox(
              child: Text(
                s,
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
  Widget buildForm2(String s) => Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 100,
        height: 80,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    fillColor: Colors.white70),
                onChanged: (value) {
                  setState(() {
                    lecLeft = int.parse(value);
                  });
                },
              ),
            ),
            FittedBox(
              child: Text(
                s,
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
  Widget buildForm3(String s) => Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 100,
        height: 80,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    fillColor: Colors.white70),
                onChanged: (value) {
                  setState(() {
                    lecLeft = int.parse(value);
                  });
                },
              ),
            ),
            FittedBox(
              child: Text(
                s,
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );

  int res(int lecD, int lecL, int total) {
    result = total - (lecD + lecL);
    return result;
  }

  Widget buildAlert(BuildContext context) => AlertDialog(
        title: Text('Result'),
        content: showContent(),
        actions: [
          TextButton(
            onPressed: () => {Navigator.pop(context)},
            child: Text('OK'),
          ),
        ],
      );

  Widget showContent() => Container(
      // color: Colors.blueAccent,
      height: 100,
      width: 100,
      child: Column(
        children: [
          Icon(
            FontAwesomeIcons.peace,
            size: 40,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            result.toString(),
            style: TextStyle(fontSize: 30),
          ),
        ],
      ));
}
