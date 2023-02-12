import 'package:epsi/models/anak_model.dart';
import 'package:flutter/material.dart';

import 'package:epsi/styleTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:epsi/providers/auth_provider.dart';
import 'package:epsi/providers/anak_provider.dart';
import 'package:epsi/providers/posyandu_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _formProfileScreen createState() => _formProfileScreen();
}

class _formProfileScreen extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    final postAnakModel = Provider.of<AnakProvider>(context, listen: false);
    postAnakModel.getAnak();

    final postModel = Provider.of<AuthProvider>(context, listen: false);
    postModel.getUser();

    final postModelPosyandu =
        Provider.of<PosyanduProvider>(context, listen: false);
    postModelPosyandu.getPosyanduDetail(idPosyandu: postModel.user?.posyandu);
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<AuthProvider>(context);
    final postAnakModel = Provider.of<AnakProvider>(context);
    final postModelPosyandu = Provider.of<PosyanduProvider>(context);
    String? dataFoto = (postModel.user?.photo == null)
        ? 'https://d1x1dyl0o67nta.cloudfront.net/default.jpeg'
        : postModel.user?.photo;
    Widget profile() {
      return Container(
        margin: const EdgeInsets.only(top: 20, left: 13),
        height: 360,
        width: 365,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: cardCustome,
              height: 320,
              width: 335,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Nama",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${postModel.user?.name}")
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Divider(
                      thickness: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Jenis Kelamin",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${postModel.user?.jenis_kelamin}")
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Divider(
                      thickness: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Posyandu",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${postModelPosyandu.posyanduDetail?.name}")
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Divider(
                      thickness: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Alamat",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          "${postModel.user?.alamat}",
                          softWrap: true,
                          maxLines: 4,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Divider(
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 8),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(4, 6),
                      spreadRadius: 0,
                      blurRadius: 8,
                      color: Color.fromARGB(15, 0, 0, 0),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    '${dataFoto}',
                    height: 70,
                    width: 70,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget headerAnak() {
      return Container(
        margin: const EdgeInsets.only(top: 30, left: 32),
        child: const Text(
          "Daftar Anak",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      );
    }

    Widget daftarAnak() {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final AnakModel dataPerAnak = postAnakModel.anak[index];
          return Center(
            child: Container(
              width: 340,
              height: 60,
              padding: const EdgeInsets.only(left: 25, right: 25),
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              decoration: cardCustome,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("${dataPerAnak.name}"),
                  SizedBox(
                    width: 110,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(19, 116, 171, 1),
                        ),
                      ),
                      child: const Text(
                        'Selengkapnya',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: postAnakModel.anak.length,
      );
    }

    Widget buttonKeluar() {
      return Center(
        child: Container(
          width: 340,
          height: 45,
          margin: const EdgeInsets.only(top: 25, bottom: 40),
          child: ElevatedButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Keluar Akun'),
                content: const Text(
                    'Apakah anda yakin untuk keluar dari akun ini ?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Tidak'),
                  ),
                  TextButton(
                    onPressed: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.clear();
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text('Iya'),
                  ),
                ],
              ),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 201, 97, 90),
              ),
            ),
            child: const Text('Keluar Akun'),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            profile(),
            headerAnak(),
            daftarAnak(),
            buttonKeluar(),
          ],
        ),
      ),
    );
  }
}
