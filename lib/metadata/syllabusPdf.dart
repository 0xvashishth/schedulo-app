import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:schedulo/metadata/api_syllabus.dart';

class SyllabusPdf extends StatefulWidget {
  const SyllabusPdf({Key? key}) : super(key: key);

  @override
  _SyllabusPdfState createState() => _SyllabusPdfState();
}

class _SyllabusPdfState extends State<SyllabusPdf> {
  String? localPath;
  @override
  void initState() {
    super.initState();
    ApiSyllabus.loadPDF().then((value) {
      setState(() {
        localPath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Syllabus",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: localPath != null
          ? PDFView(
              filePath: localPath,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
