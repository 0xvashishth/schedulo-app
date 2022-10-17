import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('FAQ'),
      ),
    );
  }
}
