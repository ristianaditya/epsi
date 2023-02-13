import 'package:flutter/material.dart';
import 'package:epsi/styleTheme.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:epsi/providers/auth_provider.dart';

class BarcodeScreen extends StatefulWidget {
  const BarcodeScreen({Key? key}) : super(key: key);
  @override
  _formBarcodeScreen createState() => _formBarcodeScreen();
}

class _formBarcodeScreen extends State<BarcodeScreen> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<AuthProvider>(context, listen: false);
    postModel.getUser();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<AuthProvider>(context);
    String? dataId =
        (postModel.user?.id == null) ? 'idKosong' : postModel.user?.id;
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
                    padding: const EdgeInsets.all(15),
                    child: SfBarcodeGenerator(
                      value: '${dataId}',
                      symbology: QRCode(),
                      // showValue: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${postModel.user?.name}".toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 21),
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
