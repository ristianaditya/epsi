import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:epsi/providers/page_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// ignore: camel_case_types
class RaportScreen extends StatelessWidget {
  const RaportScreen({super.key});
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget cardStatus() {
      return Container(
        width: 340,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                const Text(
                  'Berat Badan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 55,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(86, 210, 250, 1),
                          Color.fromRGBO(68, 156, 218, 1)
                        ]),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        '92',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Kg',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                const Text(
                  'Tinggi Badan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 55,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(86, 210, 250, 1),
                          Color.fromRGBO(68, 156, 218, 1)
                        ]),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        '92',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Cm',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                const Text(
                  'Umur',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 55,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(86, 210, 250, 1),
                          Color.fromRGBO(68, 156, 218, 1)
                        ]),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        '92',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Bulan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
        height: 230,
        width: 340,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: const Color.fromRGBO(68, 156, 218, 1)),
          boxShadow: const [
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

    Widget cardRaportList() {
      return InkWell(
        onTap: () {
          pageProvider.currentIndex = 7;
        },
        child: Center(
          child: Container(
            width: 340,
            height: 60,
            padding: const EdgeInsets.only(left: 20, right: 10),
            margin: const EdgeInsets.only(top: 5, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Color.fromRGBO(68, 156, 218, 1)),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(4, 6),
                  spreadRadius: 0,
                  blurRadius: 8,
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Raport Umur 1 Bulan",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 46, 122, 177)),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 25,
                    color: Color.fromARGB(255, 46, 122, 177),
                  ),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget cardProgresImunisasi() {
      return Container(
        height: 85,
        width: 340,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Color.fromRGBO(68, 156, 218, 1)),
          boxShadow: const [
            BoxShadow(
              offset: Offset(4, 6),
              spreadRadius: 0,
              blurRadius: 8,
              color: Color.fromRGBO(0, 0, 0, 0.06),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Progres Imunisasi',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5, bottom: 5),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 100,
                animation: true,
                lineHeight: 20.0,
                trailing: const Text(
                  "5/20",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                animationDuration: 2000,
                percent: 0.25,
                center: const Text(
                  "25.0%",
                ),
                // ignore: deprecated_member_use
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: const Color.fromRGBO(68, 156, 218, 1),
              ),
            ),
          ],
        ),
      );
    }

    Widget headerRaport() {
      return Container(
        width: 450,
        margin: const EdgeInsets.only(bottom: 5, top: 15),
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'List Raport',
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
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            cardStatus(),
            cardProgresImunisasi(),
            cardGrafik(),
            headerRaport(),
            cardRaportList(),
            cardRaportList(),
            cardRaportList(),
          ],
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
