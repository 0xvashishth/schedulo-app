import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiService {
  static String url =
      'https://www.mrsptu.ac.in/uploads2021/daa_notifications/NOTIFICATION%20113%20-%20ACADEMIC%20CALENDAR%20(NEW%20BATCH)%20FOR%20SESSION%202021-22%20(1).pdf';
  static Future<String> loadPDF() async {
    var response = await http.get(Uri.parse(url));
    var dir = await getApplicationDocumentsDirectory();
    File file = new File("${dir.path}/data.pdf");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    return file.path;
  }
}
