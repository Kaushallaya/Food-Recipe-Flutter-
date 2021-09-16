import 'package:flutter/widgets.dart';
import 'package:food_recipe/pallete.dart';
import 'package:google_fonts/google_fonts.dart';

class SubtitleWidget extends StatelessWidget {
  final String text;

  const SubtitleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
          fontSize: 15, color: accent, fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    );
  }
}
