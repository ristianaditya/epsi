import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:epsi/styleTheme.dart';
import 'package:provider/provider.dart';
import 'package:epsi/providers/page_provider.dart';
import 'package:epsi/providers/berita_provider.dart';
import 'package:html/parser.dart' show parseFragment;

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);
  @override
  _formNewsScreen createState() => _formNewsScreen();
}

class _formNewsScreen extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    final postBeritaModel = Provider.of<BeritaProvider>(context, listen: false);
    final firstBerita = postBeritaModel.berita
        .firstWhere((element) => element.id == pageProvider.idBerita);
    Widget imageCover() {
      String? dataFotoBerita =
          (firstBerita.photo == null || firstBerita.photo == '')
              ? 'https://d1x1dyl0o67nta.cloudfront.net/default_landscape.jpeg'
              : firstBerita.photo;
      return Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Image.network(
          '$dataFotoBerita',
          fit: BoxFit.cover,
          height: 40.h,
          width: MediaQuery.of(context).size.width,
        ),
      );
    }

    Widget judulBerita() {
      return Container(
        margin: const EdgeInsets.only(top: 20.0, bottom: 10),
        child: Text(
          '${firstBerita.title}',
          textAlign: TextAlign.left,
          style: const TextStyle(
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
          child: Text('${parseFragment(firstBerita.description).text}'));
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
