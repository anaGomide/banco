import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'views/card_screen.dart';
import 'views/fatura_screen.dart';
import 'views/home_screen.dart';
import 'views/shop_screen.dart';
import 'views/trasaction_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
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
          initialRoute: '/',
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            FaturaPage.routeName: (context) => FaturaPage(),
            CardPage.routeName: (context) => CardPage(),
            ShopPage.routeName: (context) => ShopPage(),
            UltimosLancamentosScreen.routeName: (context) => UltimosLancamentosScreen(transactions: []),
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: GoogleFonts.mulish().fontFamily,
            textTheme: TextTheme(
              headlineMedium: GoogleFonts.mulish(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.black),
              headlineSmall: GoogleFonts.mulish(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.white),
              titleLarge: GoogleFonts.mulish(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black),
              titleMedium: GoogleFonts.mulish(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black54),
              bodyLarge: GoogleFonts.mulish(fontSize: 16.sp, fontWeight: FontWeight.normal, color: Colors.black),
              bodySmall: GoogleFonts.mulish(fontSize: 10.sp, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 0, 0, 0)),
              labelLarge: GoogleFonts.mulish(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black),
              labelMedium: GoogleFonts.mulish(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.black),
              labelSmall: GoogleFonts.mulish(fontSize: 8.sp, fontWeight: FontWeight.w400, color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
