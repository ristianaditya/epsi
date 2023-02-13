import 'dart:convert';
import 'package:epsi/models/berita_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BeritaService {
  String baseUrl = 'http://13.213.41.91:3000/api';

  Future<List<BeritaModel>> getBerita() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var url = '$baseUrl/berita';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token'
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var databerita = data['berita'];
      List<BeritaModel> berita = [];
      for (var item in databerita) {
        berita.add(BeritaModel.fromJson(item));
      }
      return berita;
    } else {
      throw Exception('Gagal Get Data');
    }
  }
}
