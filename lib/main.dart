import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: GoogleFonts.mulish().fontFamily,
            textTheme: TextTheme(
              displayLarge: GoogleFonts.mulish(fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.black),
              displayMedium: GoogleFonts.mulish(fontSize: 28.sp, fontWeight: FontWeight.bold, color: Colors.black),
              displaySmall: GoogleFonts.mulish(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.black),
              headlineLarge: GoogleFonts.mulish(fontSize: 22.sp, fontWeight: FontWeight.w700, color: Colors.black),
              headlineMedium: GoogleFonts.mulish(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.black),
              headlineSmall: GoogleFonts.mulish(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.black),
              titleLarge: GoogleFonts.mulish(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black),
              titleMedium: GoogleFonts.mulish(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black54),
              titleSmall: GoogleFonts.mulish(fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.black54),
              bodyLarge: GoogleFonts.mulish(fontSize: 16.sp, fontWeight: FontWeight.normal, color: Colors.black),
              bodyMedium: GoogleFonts.mulish(fontSize: 14.sp, fontWeight: FontWeight.normal, color: Colors.black54),
              bodySmall: GoogleFonts.mulish(fontSize: 12.sp, fontWeight: FontWeight.normal, color: Colors.black54),
              labelLarge: GoogleFonts.mulish(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black),
              labelMedium: GoogleFonts.mulish(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black),
              labelSmall: GoogleFonts.mulish(fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.black),
            ),
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}
