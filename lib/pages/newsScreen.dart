import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:epsi/styleTheme.dart';

// ignore: camel_case_types
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Widget imageCover() {
      return Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Image.asset(
          'assets/background/berita_posyandu.jpeg',
          fit: BoxFit.cover,
          height: 40.h,
          width: MediaQuery.of(context).size.width,
        ),
      );
    }

    Widget judulBerita() {
      return Container(
        margin: const EdgeInsets.only(top: 20.0, bottom: 10),
        child: const Text(
          'Warga Nusa Loka BSD Tolak Tempat Pengelolaan Sampah Dibangun Dekat Posyandu dan Sungai',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Staatliches',
          ),
        ),
      );
    }

    Widget pengirim() {
      return Row(
        children: const <Widget>[
          Icon(
            Icons.person,
            size: 20,
          ),
          Text(
            'Paun Maharina',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(width: 30),
          Icon(
            Icons.access_time,
            size: 20,
          ),
          Text(
            '12 Jan 2022',
            style: TextStyle(fontSize: 12),
          ),
        ],
      );
    }

    Widget isiBerita() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: const Text(
          'Warga menduga pembangunan TPS3R tidak sesuai dengan prosedur standar operasi atau SOP, sebab, lokasinya berada lahan fasilitas umum (fasum) dekat posyandu dan sungai. Selain itu, warga juga mengaku belum ada sosialisasi terkait pembangunan TPS3R. "Saya menolak karena untuk apa program Kota Tanpa Kumuh (Kotaku). Buat limbah kok di permukiman. Saya pikir sudah pada setuju, ternyata tetangga pada menolak, jadi saya turut menolak juga," ujar salah seorang warga berinisial N, saat ditemui Kompas.com, Rabu (7/9/2022)Berdasarkan pengamatan Kompas.com di lokasi, terdapat gedung posyandu di sebelah lokasi pembangunan. Selain itu letak TPS3R juga dekat dengan sungai. Warga khawatir terjadi pencemaran aliran sungai dan sulit dilokalisasi apabila terjadi kebocoran. Di sekitar TPS3R juga terpasang spanduk penolakan yang bertuliskan, Kami warga RT 5 menolak pembangunan tempat pengelolaan sampah.',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 12.0,
            fontFamily: 'Oxygen',
          ),
        ),
      );
    }

    return Sizer(builder: (context, orientation, deviceType) {
      return SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 20),
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                width: 355,
                decoration: cardCustome,
                child: Column(
                  children: <Widget>[
                    judulBerita(),
                    imageCover(),
                    pengirim(),
                    isiBerita(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
