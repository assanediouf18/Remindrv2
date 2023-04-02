import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RemindrMaterialTheme {
  const RemindrMaterialTheme();

  //Retourne le widget de chargement
  /*static Center buildLoading() {
    return Center(
      child: SpinKitRotatingPlain(
        color : Colors.greenAccent[200],
        size: 25.0,
      ),
    );
  }*/

  static InputDecoration appInputDecoration = const InputDecoration(
    fillColor: Colors.white,
    filled: true,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink),
    ),
  );

  static TextStyle getTextStyle(BuildContext context, {required TextStyle? nullableTextStyle}) {
    TextStyle myTextStyle;
    if(nullableTextStyle != null) {
      myTextStyle = nullableTextStyle;
    } else {
      myTextStyle = GoogleFonts.baskervville();
    }
    return myTextStyle;
  }

  static Color getColor(BuildContext context, {required Color? nullableColor}) {
    Color myColor;
    if(nullableColor != null) {
      myColor = nullableColor;
    } else {
      myColor = Colors.green;
    }
    return myColor;
  }

  static BoxDecoration getGradientBackground(BuildContext context) {

    Color topColor = Colors.teal;
    Color middleColor = RemindrMaterialTheme.getColor(
        context,
        nullableColor: RemindrMaterialTheme.remindrpalette[400]
    );
    Color bottomColor = RemindrMaterialTheme.getColor(
        context,
        nullableColor: RemindrMaterialTheme.remindrpalette[900]
    );

    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          topColor,
          middleColor,
          bottomColor,
        ],
      ),
    );
  }

  static ButtonStyle myButtonStyle = ButtonStyle(
      elevation: MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.hovered)) {
          return 5.0;
        }
        if (states.contains(MaterialState.pressed) || states.contains(MaterialState.focused)) {
          return 0;
        }
        return 2;
      })
  );

  static const MaterialColor remindrpalette = MaterialColor(_remindrpalettePrimaryValue, <int, Color>{
    50: Color(0xFFE0F7EE),
    100: Color(0xFFB3EBD4),
    200: Color(0xFF80DDB7),
    300: Color(0xFF4DCF9A),
    400: Color(0xFF26C585),
    500: Color(_remindrpalettePrimaryValue),
    600: Color(0xFF00B567),
    700: Color(0xFF00AC5C),
    800: Color(0xFF00A452),
    900: Color(0xFF009640),
  });

  static const int _remindrpalettePrimaryValue = 0xFF00BB6F;

  static const MaterialColor remindrpaletteAccent = MaterialColor(_remindrpaletteAccentValue, <int, Color>{
    100: Color(0xFFC1FFD7),
    200: Color(_remindrpaletteAccentValue),
    400: Color(0xFF5BFF94),
    700: Color(0xFF41FF84),
  });

  static const int _remindrpaletteAccentValue = 0xFF8EFFB6;
}