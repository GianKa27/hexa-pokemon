import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 4));

      Get.offAllNamed('/home_screen');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/general/pokeball.png',
              scale: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "He",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 20, 70))),
                  TextSpan(
                      text: "x",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange)),
                  TextSpan(
                      text: "a",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 20, 70))),
                ])),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/general/pokemon.png',
                  height: 50,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
