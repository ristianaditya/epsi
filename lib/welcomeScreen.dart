import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    Widget logoLogin() {
      return Image.asset(
        'assets/logo/epsi_logo_login.png',
        height: 250,
        width: 125,
        fit: BoxFit.fill,
      );
    }

    Widget selamatDatang() {
      return Container(
        margin: const EdgeInsets.only(top: 40.0),
        child: const Text(
          'Selamat Datang',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(130, 134, 139, 1),
          ),
        ),
      );
    }

    Widget deskripsiApp() {
      return Container(
        padding: const EdgeInsets.only(right: 50, left: 50),
        margin: const EdgeInsets.only(top: 10.0),
        child: const Text(
          'EPSI membantu orang tua yang ingin mendapatkan informasi seputar pengingat jadwal kegiatan posyandu (vaksinasi, imunisasi, sosialiasi, dll), konsultasi orangtua dengan dokter dan memantau tumbuh kembang anak.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 95, 97, 100),
          ),
        ),
      );
    }

    Widget buttonRegister() {
      return Container(
        width: 350,
        height: 45,
        margin: const EdgeInsets.only(top: 15),
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            side: MaterialStateProperty.all(
              const BorderSide(
                color: Color.fromRGBO(93, 167, 219, 1),
                width: 2.5,
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: const Text(
            'Buat Akun',
            style: TextStyle(color: Color.fromRGBO(93, 167, 219, 1)),
          ),
        ),
      );
    }

    Widget buttonLogin() {
      return Container(
        width: 350,
        height: 45,
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              const Color.fromRGBO(93, 167, 219, 1),
            ),
          ),
          child: const Text('Masuk dengan Akun'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 246, 248, 1),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/welcome.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //responsive margin
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (screenSize.height >= 800) {
                      return const SizedBox(
                        height: 100,
                      );
                    } else {
                      return const SizedBox(
                        height: 70,
                      );
                    }
                  },
                ),

                logoLogin(),

                selamatDatang(),

                deskripsiApp(),

                LayoutBuilder(
                  builder: (context, constraints) {
                    if (screenSize.height >= 800) {
                      return const SizedBox(
                        height: 120,
                      );
                    } else {
                      return const SizedBox(
                        height: 50,
                      );
                    }
                  },
                ),

                buttonRegister(),

                buttonLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
