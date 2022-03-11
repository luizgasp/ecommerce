import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData theme() {
    return ThemeData(
      //backgroundColor: const Color.fromRGBO(235, 234, 239, 1),
      backgroundColor: const Color.fromARGB(255, 253, 252, 252),
      //primaryColor: const Color.fromRGBO(255, 79, 0, 1),
      primaryColor: const Color.fromRGBO(213, 25, 32, 1),
      primaryColorDark: const Color.fromRGBO(14, 14, 14, 1),
      fontFamily: 'Lato',
    );
  }
}
