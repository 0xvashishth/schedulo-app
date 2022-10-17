import 'package:flutter/material.dart';

class HallOfFame extends StatefulWidget {
  const HallOfFame({Key? key}) : super(key: key);

  @override
  _HallOfFameState createState() => _HallOfFameState();
}

class _HallOfFameState extends State<HallOfFame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('HALLOFFAME'),
      ),
    );
  }
}
