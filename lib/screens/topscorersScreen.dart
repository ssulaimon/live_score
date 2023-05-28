import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TopScorersScreen extends StatelessWidget {
  const TopScorersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (
        context,
        category,
        child,
      ) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Scorers',
              style: GoogleFonts.roboto(
                fontSize: 20,
              ),
            ),
            InteractiveViewer(
                child: DataTable(columns: [
              DataColumn(
                label: Text(
                  '#',
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              DataColumn(
                label: Text(
                  'Name',
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              DataColumn(
                label: Text(
                  'G',
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              DataColumn(
                label: Text(
                  'A',
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ], rows: []))
          ],
        );
      }),
    );
  }
}
