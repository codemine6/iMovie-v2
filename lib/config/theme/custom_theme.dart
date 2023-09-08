import 'package:flutter/material.dart';

class CustomTheme {
  final blueColor = const Color(0xFF3F55C6);
  final yellowColor = const Color(0xFFF39C12);
  final greyColor1 = const Color(0xFF9497AA);
  final darkColor1 = const Color(0xFF151318);
  final darkColor2 = const Color(0xFF28272C);

  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: blueColor,
          brightness: Brightness.dark,
          primary: blueColor,
          secondary: yellowColor,
          tertiary: greyColor1,
          background: darkColor1,
          surface: darkColor2,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: darkColor1,
          surfaceTintColor: Colors.transparent,
        ),
      );

  ThemeData get lightTheme => ThemeData();
}
