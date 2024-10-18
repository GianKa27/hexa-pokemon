import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // variables para cambiar el color de toda la app
  static const Color primaryColor = Color.fromARGB(255, 0, 78, 187);

  static const Color successColor = Color(0xff28c76f);
  static const Color infoColor = Color(0xff00cfe8);
  static const Color secondaryColor = Color.fromARGB(255, 29, 191, 255);
  static const Color warningColor = Color(0xffff9f43);
  static const Color dangerColor = Color(0xffea5455);
  static const Color lightColor = Color(0xfff6f6f6);
  static const Color darkColor = Color(0xff4b4b4b);

  static const Color azulPokemon = Color.fromARGB(255, 15, 82, 205);

  static const Color currentTextColor = Colors.black54;
  static const Color blackTextColor = Colors.white70;

  static const Color backgroundColorGeneral =
      Color.fromARGB(255, 230, 230, 230);

  static final ThemeData light = ThemeData.light().copyWith(
      primaryColor: primaryColor,
      // useMaterial3: true,
      colorScheme: const ColorScheme.light(primary: primaryColor),
      canvasColor: Colors.transparent,
      shadowColor: Colors.transparent,
      scaffoldBackgroundColor: backgroundColorGeneral,
      // primaryIconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        actionsIconTheme: const IconThemeData(color: Colors.white, size: 30),
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        toolbarTextStyle: GoogleFonts.roboto(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        titleTextStyle: GoogleFonts.roboto(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21),
        centerTitle: true,
      ),
      drawerTheme:
          const DrawerThemeData(backgroundColor: backgroundColorGeneral),
      textTheme: GoogleFonts.robotoTextTheme()
          .copyWith()
          .apply(bodyColor: currentTextColor),
      inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          fillColor: Colors.white,
          filled: true,
          hoverColor: primaryColor,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.dangerColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
              // activar borders cambiar width
              borderSide: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          labelStyle: TextStyle(fontSize: 15),
          focusColor: primaryColor),
      checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateColor.resolveWith((states) => primaryColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppTheme.primaryColor,
          linearMinHeight: 40,
          linearTrackColor: AppTheme.primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          selectedIconTheme: IconThemeData(size: 30, shadows: [
            Shadow(blurRadius: 10, color: primaryColor.withOpacity(0.8))
          ])),
      cardTheme: const CardTheme(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          surfaceTintColor: Colors.white,
          elevation: 0.2,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          extendedTextStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white),
      iconTheme: const IconThemeData(color: currentTextColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith(
            (states) => const TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: WidgetStateProperty.resolveWith((states) => darkColor),
        padding: WidgetStateProperty.resolveWith(
          (states) => const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        ),
        shape:
            WidgetStateProperty.resolveWith((states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              padding: WidgetStateProperty.resolveWith((states) =>
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
              shape: WidgetStateProperty.resolveWith((states) =>
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              side: WidgetStateProperty.resolveWith((states) =>
                  const BorderSide(color: Colors.white, width: 2)))),
      dialogTheme: const DialogTheme(
        backgroundColor: AppTheme.backgroundColorGeneral,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      timePickerTheme: const TimePickerThemeData(),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: backgroundColorGeneral,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white,
        labelPadding: EdgeInsets.symmetric(horizontal: 10),
        labelStyle: TextStyle(fontSize: 20),
      ),
      dividerTheme: const DividerThemeData(color: currentTextColor));
}
