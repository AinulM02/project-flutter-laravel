import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Travels.dart';

class TravelsServices {
  static const String _baseUrl = 'http://192.168.1.2:8000/api/';

  Future<Travels> getAllTravels() async {
    final response = await http.get(Uri.parse(_baseUrl + "travels"));
    if (response.statusCode == 200) {
      return Travels.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> createTravel(Map<String, dynamic> body) async {
    final response =
        await http.post(Uri.parse(_baseUrl + "travels"), body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteTravel(int id) async {
    final response =
        await http.delete(Uri.parse(_baseUrl + "travels/" + id.toString()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateTravel(Map<String, dynamic> body, int id) async {
    final response = await http
        .put(Uri.parse(_baseUrl + "travels/" + id.toString()), body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
