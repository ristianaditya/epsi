import 'package:epsi/models/posyandu_model.dart';
import 'package:epsi/models/kader_model.dart';
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
      List data = jsonDecode(response.body)['posyandu'];
      List<PosyanduModel> posyandu = [];

      for (var item in data) {
        posyandu.add(PosyanduModel.fromJson(item));
      }
      return posyandu;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }

  Future<PosyanduModel> getPosyanduDetail({String? idPosyandu}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var url = '$baseUrl/posyandu/$idPosyandu';
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
      PosyanduModel posyandu = PosyanduModel.fromJson(data['posyandu']);
      return posyandu;
    } else {
      throw Exception('Gagal Get Data');
    }
  }

  Future<List<KaderModel>> getKader({String? idPosyandu}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var url = '$baseUrl/posyandu/kader/$idPosyandu';
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
      var dataKader = data['kader'];
      List<KaderModel> kader = [];
      for (var item in dataKader) {
        kader.add(KaderModel.fromJson(item));
      }
      return kader;
    } else {
      throw Exception('Gagal Get Data');
    }
  }
}
