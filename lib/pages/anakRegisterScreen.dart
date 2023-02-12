import 'package:epsi/providers/auth_provider.dart';
import 'package:epsi/providers/anak_provider.dart';
import 'package:flutter/material.dart';
import 'package:epsi/styleTheme.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';
import 'package:epsi/models/user_model.dart';
import 'package:date_field/date_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnakRegisterScreen extends StatefulWidget {
  const AnakRegisterScreen({Key? key}) : super(key: key);

  @override
  _formAnakRegisterScreen createState() => _formAnakRegisterScreen();
}

// ignore: camel_case_types
class _formAnakRegisterScreen extends State<AnakRegisterScreen> {
  TextEditingController alamatController = TextEditingController(text: '');
  TextEditingController namaController = TextEditingController(text: '');
  TextEditingController tempatController = TextEditingController(text: '');
  TextEditingController nikController = TextEditingController(text: '');
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  String valueJenisKelamin = 'Laki-Laki';
  late DateTime valueDateTime;

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics.instance.setCurrentScreen(screenName: 'Register Anak');
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    AnakProvider anakProvider = Provider.of<AnakProvider>(context);
    UserModel? user = authProvider.user;
    const List<String> list = <String>['Laki-Laki', 'Perempuan'];
    String dropdownValue = list.first;

    handleSelesai() async {
      if (namaController.text == '' &&
          alamatController.text == '' &&
          tempatController.text == '') {
        if (await authProvider.verifikasi(
          verifikasi: true,
          id: user?.id,
          token: user?.token,
        )) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          UserModel? user = authProvider.user;
          pref.setString("token", "${user?.token}");
          pref.setString("verifikasi", "${user?.verifikasi}");
          pref.setString("id", "${user?.id}");
          Navigator.pushNamed(context, '/home');
        }
      } else if (formKey.currentState!.validate()) {
        if (await anakProvider.createAnak(
          name: namaController.text,
          nik: nikController.text,
          tempat_lahir: tempatController.text,
          jenis_kelamin: valueJenisKelamin,
          tanggal_lahir: valueDateTime,
          id: user?.id,
          token: user?.token,
        )) {
          if (await authProvider.verifikasi(
            verifikasi: true,
            id: user?.id,
            token: user?.token,
          )) {
            SharedPreferences pref = await SharedPreferences.getInstance();
            UserModel? user = authProvider.user;
            pref.setString("token", "${user?.token}");
            pref.setString("verifikasi", "${user?.verifikasi}");
            pref.setString("id", "${user?.id}");

            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, '/home');
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: dangerColor,
              content: const Text(
                'Gagal Register!',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      }
    }

    handleTambah() async {
      if (formKey.currentState!.validate()) {
        if (await anakProvider.createAnak(
          name: namaController.text,
          nik: nikController.text,
          tempat_lahir: tempatController.text,
          jenis_kelamin: valueJenisKelamin,
          tanggal_lahir: valueDateTime,
          id: user?.id,
          token: user?.token,
        )) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: successColor,
              content: const Text(
                'Data Anak Berhasil ditambahkan',
                textAlign: TextAlign.center,
              ),
            ),
          );
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, '/anakRegister');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: dangerColor,
              content: const Text(
                'Gagal Register!',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      }
    }

    Widget inputNama() {
      return Center(
        child: Stack(
          children: [
            Container(
              width: 340,
              height: 50,
              decoration: shadowCustom,
            ),
            Container(
              height: 78,
              width: 340,
              alignment: Alignment.topCenter,
              // ignore: sort_child_properties_last
              child: TextFormField(
                controller: namaController,
                keyboardType: TextInputType.text,
                decoration:
                    DecorationCustom('Nama Lengkap', Icons.person_outline),
                validator: Validatorless.multiple([
                  Validatorless.required('Nama wajib diisi'),
                  Validatorless.min(3, 'Nama minimal 3 huruf'),
                  Validatorless.max(16, 'Nama maximal 16 huruf'),
                ]),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputTempat() {
      return Center(
        child: Stack(
          children: [
            Container(
              width: 340,
              height: 50,
              decoration: shadowCustom,
            ),
            Container(
              height: 78,
              width: 340,
              alignment: Alignment.topCenter,
              // ignore: sort_child_properties_last
              child: TextFormField(
                controller: tempatController,
                keyboardType: TextInputType.text,
                decoration: DecorationCustom('Tempat Lahir', Icons.location_on),
                validator: Validatorless.multiple([
                  Validatorless.required('Tempat Lahir wajib diisi'),
                  Validatorless.min(3, 'Tempat Lahir minimal 3 huruf'),
                  Validatorless.max(16, 'Tempat Lahir maximal 16 huruf'),
                ]),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputNik() {
      return Center(
        child: Stack(
          children: [
            Container(
              width: 340,
              height: 50,
              decoration: shadowCustom,
            ),
            Container(
              height: 78,
              width: 340,
              alignment: Alignment.topCenter,
              // ignore: sort_child_properties_last
              child: TextFormField(
                controller: nikController,
                keyboardType: TextInputType.number,
                decoration: DecorationCustom('NIK', Icons.numbers_outlined),
                validator: Validatorless.multiple([
                  Validatorless.required('NIK wajib diisi'),
                  Validatorless.min(16, 'NIK wajib dengan 16 angka'),
                  Validatorless.max(16, 'NIK wajib dengan 16 angka'),
                ]),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputTanggal() {
      return Center(
        child: Stack(
          children: [
            Container(
              width: 340,
              height: 50,
              decoration: shadowCustom,
            ),
            Container(
              height: 78,
              width: 340,
              alignment: Alignment.topCenter,
              // ignore: sort_child_properties_last
              child: DateTimeFormField(
                decoration: DecorationCustom('tanggal Lahir', Icons.date_range),
                mode: DateTimeFieldPickerMode.date,
                autovalidateMode: AutovalidateMode.always,
                onDateSelected: (DateTime value) {
                  setState(() {
                    valueDateTime = value;
                  });
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget inputJenisKelamin() {
      return Center(
        child: Stack(
          children: [
            Container(
              width: 340,
              height: 50,
              margin: const EdgeInsets.only(bottom: 34),
              decoration: shadowCustom,
            ),
            Container(
              height: 78,
              width: 340,
              alignment: Alignment.topCenter,
              // ignore: sort_child_properties_last
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  errorStyle: const TextStyle(height: 0.8),
                  hintStyle: const TextStyle(color: Colors.grey),
                  errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                    left: 20,
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 161, 161, 161),
                    ),
                  ),
                ),
                value: dropdownValue,
                elevation: 16,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                    valueJenisKelamin = value;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget warning() {
      return Center(
        child: Container(
            width: 340,
            height: 65,
            margin: const EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(118, 233, 179, 97), width: 1.5),
                borderRadius: BorderRadius.circular(7),
                color: const Color.fromARGB(74, 228, 194, 102)),
            child: Row(
              children: const <Widget>[
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.warning_amber_rounded,
                  color: Color.fromARGB(171, 184, 116, 28),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 290,
                  child: Text(
                      'Pengguna diminta untuk memperhatikan dan melengkapi semua informasi yang wajib diisi dengan valid dan sesuai',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(169, 184, 116, 28),
                          fontWeight: FontWeight.w500),
                      softWrap: true,
                      maxLines: 4),
                ),
              ],
            )),
      );
    }

    Widget buttonTambah() {
      return Center(
        child: Container(
          width: 70,
          height: 45,
          margin: const EdgeInsets.only(top: 90, left: 7),
          child: OutlinedButton(
              onPressed: handleTambah,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: colorPrimary,
                    width: 2.5,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Icon(Icons.add_circle_outline_sharp)),
        ),
      );
    }

    Widget buttonSelesai() {
      return Center(
        child: Container(
          width: 258,
          height: 45,
          margin: const EdgeInsets.only(top: 90),
          child: ElevatedButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Perhatian'),
                content: const Text(
                    'Apakah anda yakin untuk menyelesaikan tahap ini ?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Tidak'),
                  ),
                  TextButton(
                    onPressed: handleSelesai,
                    child: const Text('Iya'),
                  ),
                ],
              ),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                colorPrimary,
              ),
            ),
            child: const Text(
              'Selesai',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    }

    return Sizer(builder: (context, orientation, deviceType) {
      return Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: backgroundColorPrimary,
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 20, left: 20, right: 17),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: backgroundImageLogin,
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: const Text(
                          'Informasi Anak',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: const Text(
                          'lengkapi data pengguna untuk melanjutkan',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      warning(),
                      inputNama(),
                      inputNik(),
                      inputTempat(),
                      inputTanggal(),
                      inputJenisKelamin(),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: <Widget>[
                          buttonTambah(),
                          SizedBox(
                            width: 10,
                          ),
                          buttonSelesai(),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
