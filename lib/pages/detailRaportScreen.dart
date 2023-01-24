import 'package:flutter/material.dart';
import 'package:epsi/styleTheme.dart';

// ignore: camel_case_types
class DetailRaportScreen extends StatelessWidget {
  const DetailRaportScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
              children: const [
                Text(
                  "Pertumbuhan Berat",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Badan",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "11 Kg",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                children: const [
                  Text(
                    "Pertumbuhan Tinggi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Badan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "20 Cm",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ],
      );
    }

    Widget cardImunisasi() {
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
            const Text(
              'Hepatitis B',
              style: TextStyle(fontSize: 16),
            ),
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: true,
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
            cardImunisasi(),
            cardImunisasi(),
            cardImunisasi(),
            cardImunisasi(),
            cardImunisasi(),
            cardImunisasi(),
            cardImunisasi(),
            cardImunisasi(),
            cardImunisasi(),
            cardImunisasi(),
            cardStatus(),
          ],
        ),
      ),
    );
  }
}
