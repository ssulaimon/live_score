import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score_ui/routes/routes.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  Future<void> pushToNextScreen() async {
    return await Future.delayed(
      const Duration(seconds: 5),
      () => context.pushReplacement(
        RouteNames.favourite,
      ),
    );
  }

  @override
  void initState() {
    pushToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: WidgetAnimator(
        atRestEffect: WidgetRestingEffects.swing(),
        child: Text(
          'Scora',
          style: GoogleFonts.roboto(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      )),
    );
  }
}
