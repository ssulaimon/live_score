import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_score_ui/models/favourite_team_model.dart';

class FavouriteSelector extends StatelessWidget {
  final Function()? ontap;
  final FavouriteTeamModel favouriteTeamModel;
  final Color color;

  const FavouriteSelector({
    required this.favouriteTeamModel,
    required this.color,
    super.key,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: ListTile(
        onTap: ontap,
        leading: Image.asset(
          favouriteTeamModel.image,
          height: 50,
          width: 50,
        ),
        title: Text(
          favouriteTeamModel.name,
          style: GoogleFonts.roboto(),
        ),
        trailing: Icon(
          Icons.star,
          color: color,
        ),
      ),
    );
  }
}
