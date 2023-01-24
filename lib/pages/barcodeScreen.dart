import 'package:flutter/material.dart';
import 'package:epsi/styleTheme.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

// ignore: camel_case_types
class BarcodeScreen extends StatelessWidget {
  const BarcodeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 310,
              padding: const EdgeInsets.only(top: 10),
              decoration: cardCustome,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/background/cornerBorder.png'),
                          fit: BoxFit.fill),
                    ),
                    height: 220,
                    width: 220,
                    padding: const EdgeInsets.all(10),
                    child: SfBarcodeGenerator(
                      value: 'www.syncfusion.com',
                      symbology: QRCode(),
                      // showValue: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Dede Rosmita",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
