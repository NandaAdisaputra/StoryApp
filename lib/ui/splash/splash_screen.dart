import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyappsdicoding/ui/auth/auth_provider.dart';
import 'package:storyappsdicoding/ui/auth/login/login_screen.dart';
import 'package:storyappsdicoding/ui/home/home_screen.dart';
import 'package:storyappsdicoding/ui/splash/splash_screen_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashProvider = Provider.of<SplashScreenProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (!splashProvider.isLoading) {
      if (authProvider.isLoggedIn) {
        return const HomeScreen();
      } else {
        return const LoginScreen();
      }
    } else {
      return const SplashScreenWidget();
    }
  }
}

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 125),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
