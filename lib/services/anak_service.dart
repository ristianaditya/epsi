import 'dart:convert';
import 'package:epsi/models/anak_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AnakService {
  String baseUrl = 'http://13.213.41.91:3000/api';

  Future<List<AnakModel>> createAnak({
    String? name,
    String? nik,
    String? tempat_lahir,
    String? jenis_kelamin,
    DateTime? tanggal_lahir,
    String? id,
    String? token,
  }) async {
    var url = '$baseUrl/anak/create';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token'
    };
    var body = jsonEncode({
      'name': name,
      'nik': nik,
      'orangtua': id,
      'jenis_kelamin': jenis_kelamin,
      'tempat_lahir': tempat_lahir,
      'tanggal_lahir': tanggal_lahir.toString(),
    });
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<AnakModel> anak = [];
      anak.add(AnakModel.fromJson(data['anak']));
      return anak;
    } else {
      throw Exception('Gagal register');
    }
  }

  Future<List<AnakModel>> getAnak() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("id");
    var token = prefs.getString("token");

    var url = '$baseUrl/user/$id';
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
      var dataAnak = data['user']['anak'];
      List<AnakModel> anak = [];
      for (var item in dataAnak) {
        anak.add(AnakModel.fromJson(item));
      }
      return anak;
    } else {
      throw Exception('Gagal Get Data');
    }
  }
}
