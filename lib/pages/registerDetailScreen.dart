import 'package:epsi/models/posyandu_model.dart';
import 'package:epsi/providers/auth_provider.dart';
import 'package:epsi/providers/posyandu_provider.dart';
import 'package:flutter/material.dart';
import 'package:epsi/styleTheme.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';
import 'package:epsi/models/user_model.dart';
import 'package:sizer/sizer.dart';

class RegisterDetailScreen extends StatefulWidget {
  const RegisterDetailScreen({Key? key}) : super(key: key);

  @override
  _formRegisterDetailScreen createState() => _formRegisterDetailScreen();
}

// ignore: camel_case_types
class _formRegisterDetailScreen extends State<RegisterDetailScreen> {
  TextEditingController alamatController = TextEditingController(text: '');
  TextEditingController posyanduController = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  String valueJenisKelamin = 'Laki-Laki';
  String valuePosyandu = '';
  late Future<PosyanduModel> futurePosyandu;

  @override
  Widget build(BuildContext context) {
    PosyanduProvider posyanduProvider = Provider.of<PosyanduProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    List<PosyanduModel> dataPosyandu = posyanduProvider.posyandu;

    UserModel? user = authProvider.user;

    TextEditingController nameController =
        TextEditingController(text: user?.name);

    TextEditingController nikController =
        TextEditingController(text: user?.nik);

    const List<String> list = <String>['Laki-Laki', 'Perempuan'];
    String dropdownValue = list.first;
    String? dropdownValuePosyandu = dataPosyandu.first.id;
    valuePosyandu = dropdownValuePosyandu!;
    handleUpdate() async {
      if (formKey.currentState!.validate()) {
        if (await authProvider.update(
          alamat: alamatController.text,
          jenis_kelamin: valueJenisKelamin,
          posyandu: valuePosyandu,
          token: user?.token,
          id: user?.id,
        )) {
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
                enabled: false,
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: DecorationReadOnlyCustom(
                    'Nama Lengkap', Icons.person_outline),
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
                enabled: false,
                controller: nikController,
                keyboardType: TextInputType.number,
                decoration:
                    DecorationReadOnlyCustom('NIK', Icons.numbers_outlined),
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

    Widget inputAlamat() {
      return Center(
        child: Stack(
          children: [
            Container(
              width: 340,
              height: 115,
              decoration: shadowCustom,
            ),
            Container(
              height: 120,
              width: 340,
              alignment: Alignment.topCenter,
              // ignore: sort_child_properties_last
              child: TextFormField(
                controller: alamatController,
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                decoration: DecorationCustom('Alamat', Icons.location_on),
                validator: Validatorless.multiple([
                  Validatorless.required('Nama wajib diisi'),
                ]),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputPosyandu() {
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
                      Icons.maps_home_work,
                      color: Color.fromARGB(255, 161, 161, 161),
                    ),
                  ),
                ),
                value: dropdownValuePosyandu,
                elevation: 16,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValuePosyandu = value!;
                    valuePosyandu = value;
                  });
                },
                items:
                    dataPosyandu.map<DropdownMenuItem<String>>((dynamic value) {
                  return DropdownMenuItem(
                    value: value.id,
                    child: Text(value.name),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonSelanjutnya() {
      return Center(
        child: Container(
          width: 340,
          height: 45,
          margin: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            onPressed: handleUpdate,
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
              'Selanjutnya',
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
                          'Informasi Pengguna',
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
                      inputJenisKelamin(),
                      inputAlamat(),
                      SizedBox(
                        height: 30,
                      ),
                      inputPosyandu(),
                      SizedBox(
                        height: 12.h,
                      ),
                      buttonSelanjutnya()
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
