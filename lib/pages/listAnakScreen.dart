import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:epsi/providers/page_provider.dart';

// ignore: camel_case_types
class ListAnakScreen extends StatelessWidget {
  const ListAnakScreen({super.key});
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        7,
        (index) {
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
                    const Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Text(
                        'Deden Saepuloh Nurohman',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 30,
                      padding: const EdgeInsets.only(top: 6),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 85, 128, 207),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(4, 6),
                            spreadRadius: 0,
                            blurRadius: 8,
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                          ),
                        ],
                      ),
                      child: const Text(
                        'Laki-Laki',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
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
