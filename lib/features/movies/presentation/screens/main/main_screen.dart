import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imovie/features/movies/presentation/screens/genres/genres_screen.dart';
import 'package:imovie/features/movies/presentation/screens/home/home_screen.dart';
import 'package:ionicons/ionicons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screen = [
    const HomeScreen(),
    const GenresScreen(),
  ];
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Ionicons.home_outline, size: 24)),
          BottomNavigationBarItem(icon: Icon(Ionicons.grid_outline, size: 24)),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
      ),
    );
  }
}
