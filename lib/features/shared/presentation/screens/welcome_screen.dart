import 'package:cine_world/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  static const name = 'welcome-screen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/logo_home.svg',
          width: 200,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/welcome.svg',
              width: 400,
            ),
            const SizedBox(height: 50),
            const Text(
              'Enjoy your favorite movies',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 5),
            const Text(
              'Anytime, Anywhere',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 50),
            FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size(320, 60),
                  backgroundColor: colors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  KeyValueStorageServiceImpl()
                      .setKeyValue<bool>('welcome', true);

                  context.go('/');
                },
                child: const Text('Get Started'))
          ],
        ),
      ),
    );
  }
}
