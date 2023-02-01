import 'package:flutter/material.dart';

import 'package:epsi/styleTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
                    children: const <Widget>[
                      Text(
                        "Nama",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rokayah Hayati',
                      )
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
                    children: const <Widget>[
                      Text(
                        "Jenis Kelamin",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Wanita',
                      ),
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
                    children: const <Widget>[
                      Text(
                        "Posyandu",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Aster',
                      ),
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
                    children: const <Widget>[
                      Text(
                        "Alamat",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          'Pameuntasan, Kutawaringin, Bandung Regency, West Java 40911',
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
                  child: Image.asset(
                    'assets/logo/foto_orang.jpg',
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
      return Center(
        child: Container(
          width: 340,
          height: 60,
          padding: const EdgeInsets.only(left: 25, right: 25),
          margin: const EdgeInsets.only(top: 10, bottom: 40),
          decoration: cardCustome,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text("Asep Berlian"),
              SizedBox(
                width: 110,
                height: 30,
                child: ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
