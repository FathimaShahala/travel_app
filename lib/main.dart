import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/Screens/booking_screen.dart';
import 'package:travel_app/Screens/bottom_navigation.dart';
import 'package:travel_app/Screens/favourite_screen.dart';
import 'package:travel_app/Screens/favourites_provider.dart';
import 'package:travel_app/Screens/home_screen.dart';
import 'package:travel_app/Screens/splash_screen.dart';
import 'package:travel_app/Screens/tickets_screen.dart';
import 'package:travel_app/Screens/user_profile_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => FavoritesProvider(), child: const TravelApp()));
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

   @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme().copyWith(),
        ),
        home: const BottomNavigationScreen(),
        routes: {
          '/homescreen': (context) => const HomeScreen(),
          '/favouritesscreen': (context) => const FavoritesScreen(),
          '/ticketsscreen': (context) => const TicketsScreen(),
          '/userprofilescreen': (context) => const UserProfile(),
          '/bookingscreen': (context) => const BookingScreen(),
        },
      ),
    );
  }
}

