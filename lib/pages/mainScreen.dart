import 'package:epsi/providers/auth_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:epsi/styleTheme.dart';
import 'package:epsi/pages/homeScreen.dart';
import 'package:epsi/pages/listAnakScreen.dart';
import 'package:epsi/pages/raportScreen.dart';
import 'package:epsi/pages/barcodeScreen.dart';
import 'package:epsi/pages/profileScreen.dart';
import 'package:epsi/pages/posyanduScreen.dart';
import 'package:epsi/pages/newsScreen.dart';
import 'package:epsi/pages/detailRaportScreen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:epsi/providers/page_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

// ignore: camel_case_types
class mainScreen extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  const mainScreen({
    Key? key,
    required this.analytics,
    required this.observer,
  }) : super(key: key);

  @override
  _mainScreen createState() => _mainScreen();
}

// ignore: camel_case_types
class _mainScreen extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    widget.analytics.setUserId(id: authProvider.user?.id);
    widget.analytics.setUserProperty(
      name: 'name',
      value: authProvider.user?.name,
    );
    var judul = '';
    var deskripsi = '';
    int buttonBack = 0;
    int currentIndex = 0;

    switch (pageProvider.currentIndex) {
      case 0:
        currentIndex = 0;
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'Home');
        break;
      case 1:
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'List Anak');
        currentIndex = 1;
        judul = "List Anak";
        deskripsi = 'Data list anak posyandu';
        buttonBack = 0;
        break;
      case 2:
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'Barcode');
        currentIndex = 2;
        judul = "Barcode";
        deskripsi = 'Scan barcode oleh pengurus posyandu';
        buttonBack = 0;
        break;
      case 3:
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'Profile');
        judul = "Profile";
        deskripsi = 'Data Profile pribadi';
        currentIndex = 3;
        break;
      case 6:
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'Raport Anak');
        currentIndex = 1;
        judul = "Raport Anak";
        deskripsi = 'Data list raport anak';
        buttonBack = 1;
        break;
      case 7:
        FirebaseAnalytics.instance
            .setCurrentScreen(screenName: 'Detail Raport Anak');
        currentIndex = 1;
        judul = "Detail Raport Anak";
        deskripsi = 'Data list imunisasi anak';
        buttonBack = 6;
        break;
      case 8:
        FirebaseAnalytics.instance.setCurrentScreen(screenName: 'News');
        currentIndex = 0;
        judul = "Berita Terbaru";
        deskripsi = 'Data detail berita terbaru';
        buttonBack = 0;
        break;
      case 9:
        FirebaseAnalytics.instance
            .setCurrentScreen(screenName: 'Detail Posyandu');
        currentIndex = 0;
        judul = "Posyandu";
        deskripsi = 'Data profile posyandu';
        buttonBack = 0;
        break;
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return const HomeScreen();
          // ignore: dead_code
          break;
        case 1:
          return const ListAnakScreen();
          // ignore: dead_code
          break;
        case 2:
          return const BarcodeScreen();
          // ignore: dead_code
          break;
        case 3:
          return const ProfileScreen();
          // ignore: dead_code
          break;
        case 6:
          return const RaportScreen();
          // ignore: dead_code
          break;
        case 7:
          return const DetailRaportScreen();
          // ignore: dead_code
          break;
        case 8:
          return const NewsScreen();
          // ignore: dead_code
          break;
        case 9:
          return const PosyanduScreen();
          // ignore: dead_code
          break;
        default:
          return const HomeScreen();
      }
    }

    Widget customBottomNav() {
      return SizedBox(
        height: 8.h,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 9.sp,
            unselectedFontSize: 9.sp,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: const Icon(
                    Icons.article,
                    size: 30,
                  ),
                ),
                label: 'Raport',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: const Icon(
                    Icons.qr_code_scanner,
                    size: 30,
                  ),
                ),
                label: 'Barcode',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: const Icon(
                    Icons.supervised_user_circle_outlined,
                    size: 30,
                  ),
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: currentIndex,
            onTap: (value) {
              pageProvider.currentIndex = value;
            },
            selectedItemColor: successColor,
          ),
        ),
      );
    }

    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Apakah anda yakin?'),
              content: const Text('Anda akan keluar dari aplikasi'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Tidak'),
                ),
                TextButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: const Text('Iya'),
                ),
              ],
            ),
          )) ??
          false;
    }

    PreferredSizeWidget customAppBar() {
      return PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: Container(
          height: 9.h,
          padding: EdgeInsets.only(left: 1.w, right: 8.w, top: 2.h),
          color: Colors.white,
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 20.sp,
                  color: const Color.fromARGB(255, 34, 31, 31),
                ),
                onPressed: () => pageProvider.currentIndex = buttonBack,
                color: const Color.fromARGB(255, 34, 31, 31),
              ),
              Container(
                height: 35,
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text(
                      judul,
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      deskripsi,
                      style: TextStyle(fontSize: 9.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 3.w,
              )
            ],
          ),
        ),
      );
    }

    return Sizer(builder: (context, orientation, deviceType) {
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            backgroundColor: backgroundColorPrimary,
            bottomNavigationBar: customBottomNav(),
            appBar: pageProvider.currentIndex != 0 ? customAppBar() : null,
            body: body()),
      );
    });
  }
}
