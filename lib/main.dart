import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovie/config/theme/custom_theme.dart';
import 'package:imovie/features/movies/presentation/screens/main/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainScreen(),
      theme: CustomTheme().darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
