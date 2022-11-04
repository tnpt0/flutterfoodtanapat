import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle{
  static Color mainColor = Color(0xff000633);
  static Color accentColor = Color(0xff0065ff);
  static Color bgColor = Color(0xffedf0f8);
  static Color PrimaryColor = Color(0xff1e283e);


  static Color cardsColor = Colors.white;

    static TextStyle mainTitle = GoogleFonts.roboto(fontSize: 15.0);
    static TextStyle mainContent = GoogleFonts.nunito(fontSize: 16.0,fontWeight: FontWeight.normal);
    static TextStyle dateTitle = GoogleFonts.roboto(fontSize: 10.0,fontWeight: FontWeight.w500);
    static TextStyle hpmainTitle = GoogleFonts.nunito(fontSize: 24.0,fontWeight: FontWeight.w600,color: Colors.black);
    static TextStyle hpcardTitle = GoogleFonts.nunito(fontSize: 24.0,fontWeight: FontWeight.w600,color: Colors.orange);
    static TextStyle noteTitle = GoogleFonts.nunito(fontSize: 20.0,color: Colors.orange);
    static TextStyle flutterfood = GoogleFonts.nunito(fontSize: 20.0,color: Colors.orange,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,);
}