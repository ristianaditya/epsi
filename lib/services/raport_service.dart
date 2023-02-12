import 'dart:convert';
import 'package:epsi/models/raport_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RaportService {
  String baseUrl = 'http://13.213.41.91:3000/api';

  Future<List<RaportModel>> getRaport({String? idAnak}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var url = '$baseUrl/rapor/anak/$idAnak';
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
      var dataRaport = data['rapor'];
      List<RaportModel> raport = [];
      for (var item in dataRaport) {
        raport.add(RaportModel.fromJson(item));
      }
      return raport;
    } else {
      throw Exception('Gagal Get Data');
    }
  }

  getImunisasi({String? idAnak}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var url = '$baseUrl/rapor/anak/$idAnak';
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
      var dataRaport = data['rapor'];

      Map<dynamic, dynamic> imunisasi = {};
      for (var item in dataRaport) {
        var data = item['imunisasi'][0];
        if (data['hepatitis_b'] == true) {
          imunisasi['hepatitis_b'] = data['hepatitis_b'];
        }
        if (data['polio'] == true) {
          imunisasi['polio'] = data['polio'];
        }
        if (data['bcg'] == true) {
          imunisasi['bcg'] = data['bcg'];
        }
        if (data['dtp'] == true) {
          imunisasi['dtp'] = data['dtp'];
        }
        if (data['hib'] == true) {
          imunisasi['hib'] = data['hib'];
        }
        if (data['pcv'] == true) {
          imunisasi['pcv'] = data['pcv'];
        }
        if (data['rotavirus'] == true) {
          imunisasi['rotavirus'] = data['rotavirus'];
        }
        if (data['influenza'] == true) {
          imunisasi['influenza'] = data['influenza'];
        }
        if (data['mr'] == true) {
          imunisasi['mr'] = data['mr'];
        }
        if (data['je'] == true) {
          imunisasi['je'] = data['je'];
        }
        if (data['varisela'] == true) {
          imunisasi['varisela'] = data['varisela'];
        }
        if (data['hepatitis_a'] == true) {
          imunisasi['hepatitis_a'] = data['hepatitis_a'];
        }
        if (data['tifoid'] == true) {
          imunisasi['tifoid'] = data['tifoid'];
        }
        if (data['dengue'] == true) {
          imunisasi['dengue'] = data['dengue'];
        }
      }
      return imunisasi;
    } else {
      throw Exception('Gagal Get Data');
    }
  }

  Future<List<grafikTinggiModel>> getGrafikTinggi({String? idAnak}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var url = '$baseUrl/rapor/tinggi/anak/$idAnak';
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
      var dataRaport = data['rapor'];
      List<grafikTinggiModel> raport = [];
      for (var item in dataRaport) {
        raport.add(grafikTinggiModel.fromJson(item));
      }
      return raport;
    } else {
      throw Exception('Gagal Get Data');
    }
  }

  Future<List<grafikBeratModel>> getGrafikBerat({String? idAnak}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var url = '$baseUrl/rapor/berat/anak/$idAnak';
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
      var dataRaport = data['rapor'];
      List<grafikBeratModel> raport = [];
      for (var item in dataRaport) {
        raport.add(grafikBeratModel.fromJson(item));
      }
      return raport;
    } else {
      throw Exception('Gagal Get Data');
    }
  }

  getGrafikDashboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var url = '$baseUrl/user/grafik/${prefs.getString("id")}';
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
      var dataGrafik = data['Grafik'];

      List grafikSemua = [];
      for (var item in dataGrafik) {
        List dataDetail = [];
        var dataDetailGrafik = item['rapor'];
        for (var itemDetail in dataDetailGrafik) {
          dataDetail.add([itemDetail['tinggi_badan'], itemDetail['bulan']]);
        }
        grafikSemua.add([item['anak'], dataDetail]);
      }
      return grafikSemua;
    } else {
      throw Exception('Gagal Get Data');
    }
  }
}
