import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:epsi/styleTheme.dart';
import 'package:provider/provider.dart';
import 'package:epsi/providers/posyandu_provider.dart';
import 'package:epsi/providers/auth_provider.dart';
import 'package:epsi/models/posyandu_model.dart';
import 'package:epsi/models/kader_model.dart';

// ignore: camel_case_types
class PosyanduScreen extends StatefulWidget {
  const PosyanduScreen({Key? key}) : super(key: key);
  @override
  _formPosyanduScreen createState() => _formPosyanduScreen();
}

class _formPosyanduScreen extends State<PosyanduScreen> {
  @override
  void initState() {
    super.initState();
    final postModelAuth = Provider.of<AuthProvider>(context, listen: false);
    final postModel = Provider.of<PosyanduProvider>(context, listen: false);
    postModel.getPosyanduDetail(idPosyandu: postModelAuth.user?.posyandu);
    postModel.getKader(idPosyandu: postModelAuth.user?.posyandu);
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<PosyanduProvider>(context);
    String? dataFotoPosyandu = (postModel.posyanduDetail?.gambar == null ||
            postModel.posyanduDetail?.gambar == '')
        ? 'https://d1x1dyl0o67nta.cloudfront.net/default_landscape.jpeg'
        : postModel.posyanduDetail?.gambar;
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
              Image.network(
                '${dataFotoPosyandu}',
                fit: BoxFit.cover,
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Nama Posyandu",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 120,
                    child: Text(
                      '${postModel.posyanduDetail?.name}',
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
                children: <Widget>[
                  const Text(
                    "Alamat",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 120,
                    child: Text(
                      '${postModel.posyanduDetail?.alamat}',
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
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final KaderModel dataPerKader = postModel.kader[index];
          return Center(
            child: Container(
              width: 350,
              height: 60,
              padding: const EdgeInsets.only(left: 25, right: 25),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: cardCustome,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${dataPerKader.name}"),
                  const Text(
                    "Hadir",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: postModel.kader.length,
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
