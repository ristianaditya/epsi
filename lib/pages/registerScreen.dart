import 'package:epsi/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:epsi/styleTheme.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

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
      setState(() {
        isLoading = false;
      });
    }

    Widget inputNama() {
      return Container(
        width: 340,
        alignment: Alignment.topCenter,
        // ignore: sort_child_properties_last
        child: TextFormField(
          controller: nameController,
          keyboardType: TextInputType.text,
          decoration: DecorationCustom('Nama Lengkap', Icons.person_outline),
        ),
        decoration: shadowCustom,
      );
    }

    Widget inputNik() {
      return Container(
        width: 340,
        margin: const EdgeInsets.only(top: 20),
        // ignore: sort_child_properties_last
        child: TextFormField(
          controller: nikController,
          keyboardType: TextInputType.number,
          decoration: DecorationCustom('NIK', Icons.numbers_outlined),
        ),
        decoration: shadowCustom,
      );
    }

    Widget inputEmail() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        width: 340,
        // ignore: sort_child_properties_last
        child: TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: DecorationCustom('Email', Icons.email_outlined),
        ),
        decoration: shadowCustom,
      );
    }

    Widget inputPassword() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        width: 340,
        // ignore: sort_child_properties_last
        child: TextFormField(
          obscureText: true,
          controller: passwordController,
          keyboardType: TextInputType.text,
          decoration: DecorationCustom('Password', Icons.lock),
        ),
        decoration: shadowCustom,
      );
    }

    Widget inputConfirmPassowrd() {
      return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10),
        width: 340,
        // ignore: sort_child_properties_last
        child: TextField(
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: DecorationCustom('Confirm Password', Icons.lock),
        ),
        decoration: shadowCustom,
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

    return Scaffold(
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
