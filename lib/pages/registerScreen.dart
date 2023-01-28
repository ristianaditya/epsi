import 'package:epsi/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:epsi/styleTheme.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({Key? key}) : super(key: key);
  @override
  _formRegisterScreen createState() => _formRegisterScreen();
}

class _formRegisterScreen extends State<registerScreen> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController nikController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;
  var valueKader = 'orangtua';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (formKey.currentState!.validate()) {
        if (await authProvider.register(
          name: nameController.text,
          nik: nikController.text,
          email: emailController.text,
          roles: valueKader,
          password: passwordController.text,
        )) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: successColor,
              content: const Text(
                'Berhasil Register!',
                textAlign: TextAlign.center,
              ),
            ),
          );
          Navigator.pushNamed(context, '/login');
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

      setState(() {
        isLoading = false;
      });
    }

    Widget inputNama() {
      return Stack(
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
              controller: nameController,
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
      );
    }

    Widget inputNik() {
      return Stack(
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
      );
    }

    Widget inputEmail() {
      return Stack(
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
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: DecorationCustom('Email', Icons.email_outlined),
              validator: Validatorless.multiple([
                Validatorless.required('Email wajib diisi'),
                Validatorless.email('Format Email salah'),
              ]),
            ),
          ),
        ],
      );
    }

    Widget inputPassword() {
      return Stack(
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
              obscureText: true,
              controller: passwordController,
              keyboardType: TextInputType.text,
              decoration: DecorationCustom('Password', Icons.lock),
              validator: Validatorless.multiple([
                Validatorless.required('Password wajib diisi'),
                Validatorless.min(8, 'Password wajib dengan 8 karakter'),
              ]),
            ),
          ),
        ],
      );
    }

    Widget inputConfirmPassowrd() {
      return Stack(
        children: [
          Container(
            width: 340,
            height: 50,
            decoration: shadowCustom,
          ),
          Container(
            height: 70,
            width: 340,
            alignment: Alignment.topCenter,
            // ignore: sort_child_properties_last
            child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: DecorationCustom('Konfirmasi Password', Icons.lock),
              validator: Validatorless.multiple([
                Validatorless.required('Konfirmasi Password wajib diisi'),
                Validatorless.compare(
                    passwordController, 'Konfirmasi Password tidak sama')
              ]),
            ),
          ),
        ],
      );
    }

    Widget dropdownPosyandu() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Apakah anda kader ',
              style: TextStyle(
                  color: textTitleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Row(
              children: <Widget>[
                Radio<String>(
                  value: 'kader',
                  groupValue: valueKader,
                  onChanged: (var value) {
                    setState(() {
                      valueKader = value!;
                      showSnackbar();
                    });
                  },
                ),
                Text('Iya',
                    style: TextStyle(
                        color: textTitleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Radio<String>(
                value: 'orangtua',
                groupValue: valueKader,
                onChanged: (var value) {
                  setState(() {
                    valueKader = value!;
                    showSnackbar();
                  });
                },
              ),
              Text(
                'Tidak',
                style: TextStyle(
                    color: textTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ],
          ),
        ],
      );
    }

    Widget buttonRegistrasi() {
      return Container(
        width: 340,
        height: 45,
        margin: const EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: handleSignUp,
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
          child: const Text('Registrasi'),
        ),
      );
    }

    Widget loadingRegistrasi() {
      return Container(
        width: 340,
        height: 45,
        margin: const EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: () {},
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(
                    Color(0xffF1F0F2),
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Loading',
              ),
            ],
          ),
        ),
      );
    }

    Widget buttonLogin() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sudah punya akun ?',
              style: TextStyle(color: textDescColor, fontSize: 13),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Masuk Sekarang',
                style: TextStyle(
                    color: textButtonColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    }

    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: backgroundColorPrimary,
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: backgroundImageLogin,
                    fit: BoxFit.cover,
                  ),
                ),
                width: 500,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),

                    logoEpsi(),

                    ilustrat(),

                    //responsive margin
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (screenSize.height >= 800) {
                          return const SizedBox(
                            height: 30,
                          );
                        } else {
                          return const SizedBox(
                            height: 10,
                          );
                        }
                      },
                    ),

                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 25, bottom: 20),
                      child: const Text(
                        'Buat akun anda',
                        style: TextStyle(
                            color: Color.fromRGBO(150, 145, 145, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),

                    inputNama(),

                    inputNik(),

                    inputEmail(),

                    inputPassword(),

                    inputConfirmPassowrd(),

                    dropdownPosyandu(),

                    isLoading ? loadingRegistrasi() : buttonRegistrasi(),

                    //responsive margin
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (screenSize.height >= 800) {
                          return const SizedBox(
                            height: 70,
                          );
                        } else {
                          return const SizedBox(
                            height: 0,
                          );
                        }
                      },
                    ),

                    buttonLogin(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$valueKader dipilih'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
