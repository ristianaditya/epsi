import 'package:flutter/material.dart';

Color backgroundColorPrimary = const Color.fromRGBO(240, 246, 248, 1);
AssetImage backgroundImageWelcome =
    const AssetImage('assets/background/welcome.png');
AssetImage backgroundImageLogin =
    const AssetImage('assets/background/welcomeNew.png');
Color colorPrimary = const Color.fromRGBO(93, 167, 219, 1);
Color successColor = const Color(0xff2C96F1);
Color dangerColor = const Color(0xffED6363);
Color textTitleColor = const Color.fromRGBO(130, 134, 139, 1);
Color textDescColor = const Color.fromARGB(255, 95, 97, 100);
Color textButtonColor = const Color.fromARGB(255, 108, 134, 219);

var shadowCustom = const BoxDecoration(
  boxShadow: [
    BoxShadow(
      offset: Offset(4, 6),
      spreadRadius: 0,
      blurRadius: 8,
      color: Color.fromRGBO(0, 0, 0, 0.06),
    ),
  ],
);

var cardCustome = const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(7)),
  boxShadow: [
    BoxShadow(
      offset: Offset(4, 6),
      spreadRadius: 0,
      blurRadius: 8,
      color: Color.fromRGBO(0, 0, 0, 0.06),
    ),
  ],
);

// ignore: non_constant_identifier_names
DecorationCustom(var nama, IconData? customIcon,
    {Padding? suffixIcon,
    EdgeInsets? contentPadding,
    OutlineInputBorder? border,
    TextStyle? hintStyle,
    String? hintText,
    Color? fillColor,
    bool? filled}) {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    hintText: nama,
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
    suffixIcon: Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Icon(
        customIcon,
        color: const Color.fromARGB(255, 161, 161, 161),
      ),
    ),
  );
}

DecorationReadOnlyCustom(var nama, IconData? customIcon,
    {Padding? suffixIcon,
    EdgeInsets? contentPadding,
    OutlineInputBorder? border,
    TextStyle? hintStyle,
    String? hintText,
    Color? fillColor,
    bool? filled}) {
  return InputDecoration(
    fillColor: Color.fromARGB(148, 253, 252, 252),
    filled: true,
    hintText: nama,
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
    suffixIcon: Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Icon(
        customIcon,
        color: const Color.fromARGB(255, 161, 161, 161),
      ),
    ),
  );
}

String truncateCustome(String text, {length = 7, omission = '...'}) {
  if (length >= text.length) {
    return text;
  }
  return text.replaceRange(length, text.length, omission);
}

Widget logoEpsi() {
  return Container(
    alignment: Alignment.topRight,
    padding: const EdgeInsets.only(right: 30),
    child: Image.asset(
      'assets/logo/epsi_title.png',
      height: 24,
      width: 100,
      fit: BoxFit.fill,
    ),
  );
}

Widget ilustrat() {
  return Image.asset(
    'assets/background/ilustr_login.png',
    height: 250,
    width: 270,
  );
}
