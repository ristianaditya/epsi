import 'package:flutter/material.dart';
import 'package:epsi/styleTheme.dart';
import 'package:provider/provider.dart';
import 'package:epsi/providers/page_provider.dart';
import 'package:epsi/providers/raport_provider.dart';

// ignore: camel_case_types
class DetailRaportScreen extends StatefulWidget {
  const DetailRaportScreen({Key? key}) : super(key: key);
  @override
  _formDetailRaportScreen createState() => _formDetailRaportScreen();
}

class _formDetailRaportScreen extends State<DetailRaportScreen> {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    final raportProvider = Provider.of<RaportProvider>(context, listen: false);
    final detailRaport = raportProvider.raport
        .firstWhere((element) => element.id == pageProvider.idRaport);
    bool isChecked = false;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return Colors.blue;
    }

    Widget cardStatus() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 160,
            height: 120,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(top: 5, bottom: 10),
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
              children: [
                const Text(
                  "Pertumbuhan Berat",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Badan",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "${detailRaport.berat_badan} Kg",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
              width: 160,
              height: 120,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 5, bottom: 10),
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
                children: [
                  const Text(
                    "Pertumbuhan Tinggi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Badan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "${detailRaport.tinggi_badan} Cm",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ],
      );
    }

    Widget cardImunisasi(String? imunisasi, bool? check) {
      return Container(
        width: 340,
        height: 60,
        padding: const EdgeInsets.only(left: 20, right: 10),
        margin: const EdgeInsets.only(top: 5, bottom: 10),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$imunisasi',
              style: TextStyle(fontSize: 16),
            ),
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: check,
                onChanged: null,
              ),
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
              height: 10,
            ),
            cardImunisasi('Hepatitis B', detailRaport.hepatitis_b),
            cardImunisasi('Polio', detailRaport.polio),
            cardImunisasi('BCG', detailRaport.bcg),
            cardImunisasi('DTP', detailRaport.dtp),
            cardImunisasi('HIB', detailRaport.hib),
            cardImunisasi('PCV', detailRaport.pcv),
            cardImunisasi('ROTAVIRUS', detailRaport.rotavirus),
            cardImunisasi('INFLUENZA', detailRaport.influenza),
            cardImunisasi('MR', detailRaport.mr),
            cardImunisasi('JE', detailRaport.je),
            cardImunisasi('VARISELA', detailRaport.varisela),
            cardImunisasi('HEPATITIS A', detailRaport.hepatitis_a),
            cardImunisasi('TIFOID', detailRaport.tifoid),
            cardImunisasi('DENGUE', detailRaport.dengue),
            cardStatus(),
          ],
        ),
      ),
    );
  }
}
