import 'package:flutter/material.dart';

// ignore: camel_case_types
abstract class styleLoginRegister {
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
      hintStyle: const TextStyle(color: Colors.grey),
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
}
