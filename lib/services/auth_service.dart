import 'dart:convert';
import 'package:epsi/models/user_model.dart';
import 'package:epsi/models/anak_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'http://13.213.41.91:3000/api';

  Future<UserModel> register(
      {String? name,
      String? nik,
      String? email,
      String? roles,
      String? password}) async {
    var url = '$baseUrl/signup';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'nik': nik,
      'email': email,
      'roles': 'orangtua',
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      user.id = data['user']['_id'];
      user.posyandu = data['user']['posyandu'];
      return user;
    } else {
      throw Exception('Gagal register');
    }
  }

  Future<UserModel> update({
    String? alamat,
    String? jenis_kelamin,
    String? posyandu,
    String? token,
    String? id,
  }) async {
    var url = '$baseUrl/user/update/$id';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token'
    };
    var body = jsonEncode({
      'alamat': alamat,
      'jenis_kelamin': jenis_kelamin,
      'posyandu': posyandu,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['user']);
      user.token = '$token';
      user.id = data['user']['_id'];
      user.posyandu = data['user']['posyandu'];
      return user;
    } else {
      throw Exception('Gagal register');
    }
  }

  Future<UserModel> verifikasi({
    bool? verifikasi,
    String? id,
    String? token,
  }) async {
    var url = '$baseUrl/user/update/$id';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token'
    };
    var body = jsonEncode({
      'verifikasi': verifikasi,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['user']);
      user.token = token;
      user.id = data['user']['_id'];
      user.posyandu = data['user']['posyandu'];
      return user;
    } else {
      throw Exception('Gagal register');
    }
  }

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/signin';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      user.id = data['user']['_id'];
      user.posyandu = data['user']['posyandu'];
      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<UserModel> getUser() async {
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
      UserModel user = UserModel.fromJson(data['user']);
      user.posyandu = data['user']['posyandu']['_id'];
      user.token = token;
      user.id = id;
      return user;
    } else {
      throw Exception('Gagal Get Data');
    }
  }
}
