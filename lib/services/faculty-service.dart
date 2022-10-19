// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:convert' as convert;

import 'package:schedulo/modals/facultyModel.dart';
import 'package:http/http.dart' as http;

class FacultyService {
  Future<List<FacultyModel>> getFaculty() async {
    // var response;
    // try {
    //   await http
    //       .get(
    //         Uri.parse('https://schedulo-api.ayushrudani.repl.co/api/faculty/'),
    //       )
    //       .then((value) => response = jsonDecode(value.body));
    // } catch (r) {
    //   print(r);
    // }

    try {
      final response = await http.get(
        Uri.parse('https://schedulo-api.ayushrudani.repl.co/api/faculty/'),
      );
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        var data = jsonResponse['faculty'] as List;
        // print(data);
        return data.map((e) => FacultyModel.fromJson(e)).toList();
      } else {
        print("Error");
        throw Exception('Failed to load faculty');
      }
    } catch (err) {
      print(err);
    }
    return [];

    // final response = await http.get(
    //     Uri.parse('https://schedulo-api.ayushrudani.repl.co/api/faculty/'));
    // if (response.statusCode == 200) {
    //   List jsonResponse = json.decode(response.body);
    //   return jsonResponse.map((f) => new FacultyModel.fromJson(f)).toList();
    // } else {
    //   throw Exception('Failed to load faculty');
    // }
    // return response.map((f) => new FacultyModel.fromJson(f)).toList();
  }

  // Future<FacultyModel> getFacultyById(String id) async {
  //   final response = await http.get(
  //       Uri.parse('https://schedulo-api.ayushrudani.repl.co/api/faculty/$id'));
  //   if (response.statusCode == 200) {
  //     return FacultyModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load faculty');
  //   }
  // }
}



  // void getFaculty() {
  // var response;
  // try {
  //   http
  //       .get(
  //     Uri.parse('https://schedulo-api.ayushrudani.repl.co/api/faculty/'),
  //   )
  //       .then((value) {
  //     response = convert.jsonDecode(value.body) as Map<String, dynamic>;
  //     print("Before the print");
  //     print(response['faculty'][0]['name']);
  //     print("After the print");
  //   });
  // } catch (r) {
  //   print(r);
  // }

  // final response = await http.get(
  //     Uri.parse('https://schedulo-api.ayushrudani.repl.co/api/faculty/'));
  // if (response.statusCode == 200) {
  //   List jsonResponse = json.decode(response.body);
  //   return jsonResponse.map((f) => new FacultyModel.fromJson(f)).toList();
  // } else {
  //   throw Exception('Failed to load faculty');
  // }
  // return response.map((f) => new FacultyModel.fromJson(f)).toList();
  // }