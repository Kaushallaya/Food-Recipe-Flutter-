import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Color color;

  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.onClicked,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: MediaQuery.of(context).size.width - 40.0,
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: onClicked,
              //   Navigator.pushNamed(context, '/login');
              child: Text(
                text,
                style: GoogleFonts.inter(fontWeight: FontWeight.bold),
              )),
        ),
      );
}
