import 'package:epsi/models/posyandu_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PosyanduService {
  String baseUrl = 'http://13.213.41.91:3000/api';
  Future<List<PosyanduModel>> getPosyandu({
    String? token,
  }) async {
    var url = '$baseUrl/posyandu';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.getString("token");
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token'
    };

    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['Posyandu'];
      List<PosyanduModel> posyandu = [];

      for (var item in data) {
        posyandu.add(PosyanduModel.fromJson(item));
      }
      return posyandu;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
