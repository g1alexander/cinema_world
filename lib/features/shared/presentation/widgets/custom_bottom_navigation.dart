import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final StatefulNavigationShell currentChild;
  const CustomBottomNavigation({super.key, required this.currentChild});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        onTap: (index) => currentChild.goBranch(index),
        currentIndex: currentChild.currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.thumbs_up_down_outlined), label: 'Populares'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favoritos')
        ]);
  }
}
