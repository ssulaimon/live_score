import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class NavigationWidge extends StatelessWidget {
  final String name;
  final Function()? onTap;
  final String iconPath;
  final Color? textColor;
  const NavigationWidge({
    super.key,
    required this.iconPath,
    required this.name,
    this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        iconPath,
        height: 30,
        width: 30,
      ),
      title: Text(
        name,
        style: GoogleFonts.roboto(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
