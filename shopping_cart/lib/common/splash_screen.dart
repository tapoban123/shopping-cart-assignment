import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_cart/catalogue/pages/catalogue_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  ValueNotifier<bool> spaceLetters = ValueNotifier(false);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    _controller.addStatusListener(
      (status) {
        if (status.isCompleted) {
          spaceLetters.value = true;
        }
      },
    );

    Future.delayed(
      const Duration(milliseconds: 1400),
      () {
        if (mounted) {
          Navigator.of(context).pushReplacement(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const CataloguePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: const Offset(1, 0), end: Offset.zero)
                  .animate(CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ));

              return SlideTransition(
                position: tween,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 500),
          ));
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: ValueListenableBuilder(
            valueListenable: spaceLetters,
            builder: (context, spaceLettersValue, child) =>
                AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: "Cabin",
                letterSpacing: spaceLettersValue ? 6.0 : 0.0,
              ),
              child: const Text(
                "Shopping Cart",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
