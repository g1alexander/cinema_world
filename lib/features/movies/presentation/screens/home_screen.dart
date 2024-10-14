import 'package:cinema_world/features/shared/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  final bool isBottomNavigationVisible;

  final StatefulNavigationShell currentChild;

  const HomeScreen(
      {super.key,
      required this.currentChild,
      this.isBottomNavigationVisible = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentChild,
      bottomNavigationBar: isBottomNavigationVisible
          ? CustomBottomNavigation(currentChild: currentChild)
          : null,
    );
  }
}
