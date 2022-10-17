import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiSyllabus {
  static String url =
      'https://www.mrsptu.ac.in/uploads2021/syllabus/MRSPTU%20B.Tech.%20CSE%206th%20sem%20syllabus%202018%20Batch%20onwards.pdf';
  static Future<String> loadPDF() async {
    var response = await http.get(Uri.parse(url));
    var dir = await getApplicationDocumentsDirectory();
    File file = new File("${dir.path}/data1.pdf");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    return file.path;
  }
}
