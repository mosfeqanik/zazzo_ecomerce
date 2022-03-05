
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mosfeqanik/utils/app_colors.dart';

class TextThemes {
  static final Color ndGold = Color.fromRGBO(220, 180, 57, 1.0);


  static final TextStyle blueTextFieldMedium = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Color.fromRGBO(9, 165, 255, 1.0),
  );
  static final TextStyle GreetingTextStyle = GoogleFonts.poppins(
    fontSize: 15,
    color: AppColors.kSecondaryGreyColor,
  );
  static final TextStyle UserNameStyle = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.kBlackColor,
  );

  static final TextStyle ParaheadingStyle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.kBlackColor,
  );
  static final TextStyle AddtoCartButtonTextStyle = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.kBlueColor,
  );
  static final TextStyle productNameTextStyle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.kBlackColor,
  );
  static final TextStyle productPriceTextStyle = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.kBlackColor,
  );
  static final TextStyle productDisciuntPriceTextStyle = GoogleFonts.poppins(
    fontSize: 13,
    decoration: TextDecoration.lineThrough,
    fontWeight: FontWeight.w600,
    color: AppColors.kSecondaryGreyColor,
  );

  static final TextStyle kButtonTextBold =TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

}
