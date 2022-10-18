import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiSyllabus {
  // Providing link for pdf
  static String url =
      'https://ddu.ac.in/pdf/BTech_CE_Syllabus_2020_Onwards_SEPT_2022.pdf';

  // Fetching pdf from url and saving it in device
  static Future<String> loadPDF() async {
    var response = await http.get(Uri.parse(url));
    var dir = await getApplicationDocumentsDirectory();
    File file = new File("${dir.path}/data1.pdf");
    
    // Opens the file, writes the list of bytes to it and closes the file.
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    return file.path;
  }
}
