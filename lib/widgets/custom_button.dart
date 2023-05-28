import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_score_ui/const/colors.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Function()? ontap;
  const CustomButton({
    super.key,
    this.ontap,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: AppColors.primaryColor),
        child: Text(
          name,
          style: GoogleFonts.roboto(fontSize: 20, color: AppColors.white),
        ),
      ),
    );
  }
}
