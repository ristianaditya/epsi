import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:epsi/providers/page_provider.dart';
import 'package:epsi/providers/anak_provider.dart';
import 'package:epsi/models/anak_model.dart';

// ignore: camel_case_types
class ListAnakScreen extends StatefulWidget {
  const ListAnakScreen({Key? key}) : super(key: key);
  @override
  _formListAnakScreen createState() => _formListAnakScreen();
}

class _formListAnakScreen extends State<ListAnakScreen> {
  @override
  void initState() {
    super.initState();
    final postAnakModel = Provider.of<AnakProvider>(context, listen: false);
    postAnakModel.getAnak();
  }

  @override
  Widget build(BuildContext context) {
    final postAnakModel = Provider.of<AnakProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        postAnakModel.anak.length,
        (index) {
          final AnakModel dataPerAnak = postAnakModel.anak[index];
          final dataWarna = (dataPerAnak.jenis_kelamin == 'Laki-Laki')
              ? Color.fromARGB(255, 85, 128, 207)
              : Color.fromARGB(255, 207, 85, 146);
          return InkWell(
            onTap: () {
              pageProvider.currentIndex = 6;
            },
            child: Center(
              child: Container(
                width: 165,
                height: 170,
                margin: const EdgeInsets.only(top: 10),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/icon/icon_profile.png',
                        height: 50, width: 50, fit: BoxFit.fill),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Text(
                        '${dataPerAnak.name}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 30,
                      padding: const EdgeInsets.only(top: 6),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: dataWarna,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(4, 6),
                            spreadRadius: 0,
                            blurRadius: 8,
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                          ),
                        ],
                      ),
                      child: Text(
                        '${dataPerAnak.jenis_kelamin}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
