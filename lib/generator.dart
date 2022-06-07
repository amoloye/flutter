import 'dart:convert';

import 'package:http/http.dart' as http;
class Numbers{
  String status;
  int min;
  int max;
  int random;

  Numbers(
      {required this.status,
       required this.min,
        required this.max,
        required this.random});

  factory Numbers.fromJson(Map<String, dynamic> json)=> Numbers(
      status: json["status"],
      min: json["min"],
      max: json["max"],
      random:json["random"],
  );

}

Future<Numbers> getNumbers() async {
  final response = await http
      .get(Uri.parse('https://csrng.net/csrng/csrng.php?min=1&max=100'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Numbers.fromJson(jsonDecode(response.body)[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load numbers');
  }
}