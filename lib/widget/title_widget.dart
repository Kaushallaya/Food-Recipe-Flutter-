import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  final String text;

  const TitleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 22));
  }
}
