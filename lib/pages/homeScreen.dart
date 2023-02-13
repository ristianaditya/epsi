import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:epsi/styleTheme.dart';
import 'package:provider/provider.dart';
import 'package:epsi/providers/page_provider.dart';
import 'package:epsi/providers/auth_provider.dart';
import 'package:epsi/providers/raport_provider.dart';
import 'package:epsi/providers/berita_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:epsi/models/berita_model.dart';
import 'package:html/parser.dart' show parseFragment;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _formHomeScreen createState() => _formHomeScreen();
}

class _formHomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<AuthProvider>(context, listen: false);
    postModel.getUser();

    final postBeritaModel = Provider.of<BeritaProvider>(context, listen: false);
    postBeritaModel.getBerita();

    final postRaportModel = Provider.of<RaportProvider>(context, listen: false);
    postRaportModel.getRaportDashboard();
  }

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    final postModel = Provider.of<AuthProvider>(context);
    final postBeritaModel = Provider.of<BeritaProvider>(context);
    final postRaportModel = Provider.of<RaportProvider>(context);

    String? dataFoto = (postModel.user?.photo == null)
        ? 'https://i.ibb.co/2dXghKF/icon-profile.png'
        : postModel.user?.photo;

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
              onPressed: () {
                pageProvider.currentIndex = 3;
              },
              icon: Icon(
                Icons.settings,
                color: Colors.blue.shade300,
              )),
        ],
      );
    }

    Widget cardProfile() {
      return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
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
                child: Image.network(
                  '${dataFoto}',
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
                children: <Widget>[
                  const Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('${postModel.user?.name}'.toUpperCase(),
                      style: const TextStyle(
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
                        onPressed: () {
                          pageProvider.currentIndex = 9;
                        },
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
                        onPressed: () {
                          pageProvider.currentIndex = 1;
                        },
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
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var dataPerAnak = postRaportModel.dashboard?[index];
          List<LinearSales> dataBerat = [];
          for (var item in dataPerAnak[1]) {
            dataBerat.add(LinearSales(item[1], item[0]));
          }
          List<charts.Series<LinearSales, int>> series = [
            charts.Series(
              id: "Products",
              colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
              data: dataBerat,
              domainFn: (LinearSales series, _) => series.year,
              measureFn: (LinearSales series, _) => series.sales,
            )
          ];
          return Center(
              child: Container(
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
                Text('Grafik rekap pertumbuhan anak ${dataPerAnak[0]}'),
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
          ));
        },
        itemCount: postRaportModel.dashboard?.length ?? 0,
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
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final BeritaModel dataPerBerita = postBeritaModel.berita[index];
          String? dataFotoBerita = (dataPerBerita.photo == null ||
                  dataPerBerita.photo == '')
              ? 'https://d1x1dyl0o67nta.cloudfront.net/default_landscape.jpeg'
              : dataPerBerita.photo;
          return InkWell(
            onTap: () {
              pageProvider.currentIndex = 8;
              pageProvider.idBerita = dataPerBerita.id!;
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.only(right: 7, left: 7),
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
                    child: Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Image.network(
                        '$dataFotoBerita',
                        height: 12.h,
                        width: 10.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            truncateCustome('${dataPerBerita.title}',
                                length: 55),
                            style: TextStyle(
                                color: successColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            truncateCustome(
                                '${parseFragment(dataPerBerita.description).text}',
                                length: 70),
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Baca Selengkapnya',
                            style: TextStyle(color: successColor, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: postBeritaModel.berita.length,
      );
    }

    return Sizer(builder: (context, orientation, deviceType) {
      return SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                header(),
                cardProfile(),
                cardPosyandu(),
                cardRaport(),
                cardGrafik(),
                headerNews(),
                Container(
                  width: 340,
                  child: cardNews(),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
