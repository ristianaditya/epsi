import 'package:epsi/styleTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:epsi/providers/auth_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: camel_case_types
class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);
  @override
  _formLoginScreen createState() => _formLoginScreen();
}

class _formLoginScreen extends State<loginScreen> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;

  Future<void> signIn() async {
    try {
      await GoogleSignInApi.login();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: dangerColor,
            content: const Text(
              'Gagal Login!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget inputEmail() {
      return Container(
        width: 340,
        // ignore: sort_child_properties_last
        child: TextFormField(
          controller: emailController,
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
        child: TextField(
          obscureText: true,
          controller: passwordController,
          decoration: DecorationCustom('Password', Icons.lock),
        ),
        decoration: shadowCustom,
      );
    }

    Widget ubahPassword() {
      return Container(
        alignment: Alignment.topRight,
        margin: const EdgeInsets.only(right: 25),
        child: TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: null,
          child: Text(
            'Ubah Password ?',
            style: TextStyle(color: textTitleColor, fontSize: 13),
          ),
        ),
      );
    }

    Widget buttonLogin() {
      return Container(
        width: 340,
        height: 45,
        margin: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
          onPressed: handleSignIn,
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
          child: const Text('Login'),
        ),
      );
    }

    Widget loadingLogin() {
      return Container(
        width: 340,
        height: 45,
        margin: const EdgeInsets.only(top: 10),
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

    Widget buttonSocial() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 55,
            height: 55,
            margin: const EdgeInsets.only(top: 10, right: 10),
            child: ElevatedButton(
              onPressed: () async {
                await signIn();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Image.asset(
                'assets/icon/google_icon.png',
                height: 25,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: 55,
            height: 55,
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const loginScreen();
                    },
                  ),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(24, 119, 242, 1),
                ),
              ),
              child: Image.asset(
                'assets/icon/facebook_icon.png',
                height: 25,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      );
    }

    Widget register() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tidak punya akun ?',
              style: TextStyle(color: textDescColor, fontSize: 13),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                'Daftar Sekarang',
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: backgroundImageLogin,
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: 500,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),

                  logoEpsi(),

                  ilustrat(),

                  // responsive margin
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
                      'Masuk ke akun anda',
                      style: TextStyle(
                          color: Color.fromRGBO(150, 145, 145, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),

                  inputEmail(),

                  inputPassword(),

                  ubahPassword(),

                  isLoading ? loadingLogin() : buttonLogin(),

                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 25),
                    child: Text(
                      'Atau masuk dengan akun',
                      style: TextStyle(color: textTitleColor, fontSize: 13),
                    ),
                  ),

                  buttonSocial(),

                  // responsive margin
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

                  register(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
