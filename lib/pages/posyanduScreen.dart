import 'package:flutter/material.dart';
import 'package:epsi/styleTheme.dart';

// ignore: camel_case_types
class PosyanduScreen extends StatelessWidget {
  const PosyanduScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Widget dataPosyandu() {
      return Center(
        child: Container(
          width: 350,
          height: 480,
          padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: cardCustome,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/background/posyandu.jpg',
                fit: BoxFit.cover,
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "Nama Posyandu",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 120,
                    child: Text(
                      'Posyandu Aster',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "RT / RW",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 120,
                    child: Text(
                      '01/02',
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget dataKader() {
      return Center(
        child: Container(
          width: 350,
          height: 60,
          padding: const EdgeInsets.only(left: 25, right: 25),
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: cardCustome,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Asep Berlian"),
              Text(
                "Hadir",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }

    Widget headerKader() {
      return Container(
        width: 450,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Daftar Kader',
              style: TextStyle(
                  color: Color.fromARGB(255, 51, 144, 219),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 3,
            ),
            Divider(
              color: Color.fromARGB(255, 129, 192, 243),
              thickness: 3,
            ),
          ],
        ),
      );
    }

    Widget headerPosyandu() {
      return Container(
        width: 450,
        margin: const EdgeInsets.only(top: 30, bottom: 10),
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Data Posyandu',
              style: TextStyle(
                  color: Color.fromARGB(255, 51, 144, 219),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 3,
            ),
            Divider(
              color: Color.fromARGB(255, 129, 192, 243),
              thickness: 3,
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            headerPosyandu(),
            dataPosyandu(),
            headerKader(),
            dataKader(),
          ],
        ),
      ),
    );
  }
}
