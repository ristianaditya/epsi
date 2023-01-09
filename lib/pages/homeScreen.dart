import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:epsi/styleTheme.dart';

// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _homeScreen createState() => _homeScreen();
}

// ignore: camel_case_types
class _homeScreen extends State<homeScreen> {
  Widget header() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Image.asset('assets/logo/epsi_title.png',
              height: 20, width: 77, fit: BoxFit.fill),
        ),
        const Spacer(),
        IconButton(
            padding: const EdgeInsets.only(right: 30),
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.blue.shade300,
            )),
      ],
    );
  }

  Widget cardProfile() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 90,
      width: 335,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background/card_profile_home.png'),
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 6),
            spreadRadius: 0,
            blurRadius: 8,
            color: Color.fromRGBO(0, 0, 0, 0.06),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 15, right: 8),
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 6),
                  spreadRadius: 0,
                  blurRadius: 8,
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/logo/foto_orang.jpg',
                height: 60,
                width: 60,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(top: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Ibu Rokayah Hayati',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardPosyandu() {
    return SizedBox(
      height: 175,
      width: 365,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background/card_home2.png'),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 6),
                  spreadRadius: 0,
                  blurRadius: 8,
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                ),
              ],
            ),
            height: 150,
            width: 335,
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Informasi Posyandu',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Kenali lebih dekat posyandu',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Sekitar anda',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 110,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {},
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
          ),
          Positioned(
            left: 190,
            top: 15,
            child: Image.asset(
              'assets/background/Illustr_card_home1.png',
              fit: BoxFit.cover,
              height: 170,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardRaport() {
    return SizedBox(
      height: 180,
      width: 365,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background/card_home2.png'),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 6),
                  spreadRadius: 0,
                  blurRadius: 8,
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                ),
              ],
            ),
            height: 150,
            width: 335,
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Raport Anak',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Pantau mudah perkembangan',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'si kecil',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 110,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {},
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
          ),
          Positioned(
            left: 210,
            top: 0,
            child: Image.asset(
              'assets/background/ilustr_card_home2.png',
              fit: BoxFit.cover,
              height: 160,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardGrafik() {
    final data = [
      LinearSales(0, 5),
      LinearSales(1, 25),
      LinearSales(2, 100),
      LinearSales(3, 90),
      LinearSales(4, 2),
      LinearSales(5, 71),
      LinearSales(6, 81),
      LinearSales(7, 75),
    ];
    List<charts.Series<LinearSales, int>> series = [
      charts.Series(
        id: "Products",
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        data: data,
        domainFn: (LinearSales series, _) => series.year,
        measureFn: (LinearSales series, _) => series.sales,
      )
    ];
    return Container(
      height: 220,
      width: 335,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 6),
            spreadRadius: 0,
            blurRadius: 8,
            color: Color.fromRGBO(0, 0, 0, 0.06),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 3,
          ),
          const Text('Grafik rekap pertumbuhan anak'),
          const SizedBox(
            height: 3,
          ),
          const Divider(
            color: Color.fromARGB(255, 59, 126, 180),
            thickness: 1,
          ),
          Expanded(
            child: charts.LineChart(series, animate: true),
          ),
        ],
      ),
    );
  }

  Widget headerNews() {
    return Container(
      width: 450,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            'Berita Terkini',
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

  Widget cardNews() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 340,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(right: 7),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 6),
              spreadRadius: 0,
              blurRadius: 8,
              color: Color.fromRGBO(0, 0, 0, 0.06),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/logo/foto_orang.jpg',
                height: 100,
                width: 100,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Menkes hingga Shahnaz Haque Puji Kader Posyandu Banyuwangi',
                      style: TextStyle(
                          color: Color.fromARGB(255, 72, 151, 216),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      truncate(
                          'Menteri Kesehatan Budi Gunadi Sadikin hingga pesohor Shahnaz Haque memuji',
                          length: 70),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorPrimary,
      bottomNavigationBar: SizedBox(
        height: 65,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 13,
            unselectedFontSize: 13,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Image.asset(
                    'assets/icon/home.png',
                    height: 25,
                    width: 25,
                    fit: BoxFit.fill,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: Image.asset(
                    'assets/icon/book.png',
                    height: 25,
                    width: 26,
                    fit: BoxFit.fill,
                  ),
                ),
                label: 'Raport',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Image.asset(
                    'assets/icon/barcode.png',
                    height: 23,
                    width: 24,
                    fit: BoxFit.fill,
                  ),
                ),
                label: 'Barcode',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: Image.asset(
                    'assets/icon/user.png',
                    height: 27,
                    width: 27,
                    fit: BoxFit.fill,
                  ),
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: 0,
            selectedItemColor: const Color.fromARGB(255, 89, 0, 255),
            onTap: null,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                header(),
                cardProfile(),
                const SizedBox(
                  height: 20,
                ),
                cardPosyandu(),
                cardRaport(),
                cardGrafik(),
                headerNews(),
                cardNews(),
                cardNews(),
                cardNews(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

String truncate(String text, {length = 7, omission = '...'}) {
  if (length >= text.length) {
    return text;
  }
  return text.replaceRange(length, text.length, omission);
}
