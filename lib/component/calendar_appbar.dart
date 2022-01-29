import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarAppBar extends StatelessWidget with PreferredSizeWidget{
  const CalendarAppBar({
    Key? key,
    required this.title
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.cormorantGaramond(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          )
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
