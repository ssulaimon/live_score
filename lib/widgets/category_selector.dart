import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_score_ui/const/colors.dart';

class CategorySelector extends StatelessWidget {
  final String name;
  final Function()? onTap;
  final Color? backGroundColor;
  final Color textColor;
  const CategorySelector({
    super.key,
    this.onTap,
    required this.textColor,
    this.backGroundColor,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(
            8,
          ),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
        ),
        child: Text(
          name,
          style: GoogleFonts.roboto(color: textColor),
        ),
      ),
    );
  }
}
