import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text,  this.lines, this.overflow, this.size, this.fontWeight, this.color, this.letterSpacing, this.height});
  final String text;
  final int? lines;
  final TextOverflow? overflow;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? letterSpacing;
  final double? height;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      maxLines: lines,
      overflow: overflow,
      style: GoogleFonts.montserrat(
        fontSize:size,
        fontWeight: fontWeight,
        color: color, 
        letterSpacing:letterSpacing,
        height: height

      ),
    );
  }
}