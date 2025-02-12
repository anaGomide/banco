import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/card_screen.dart';
import '../views/fatura_screen.dart';
import '../views/home_screen.dart';
import '../views/shop_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({required this.selectedIndex, Key? key}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    final routes = [
      HomeScreen.routeName,
      FaturaPage.routeName,
      CardPage.routeName,
      ShopPage.routeName,
    ];

    if (routes[index] != ModalRoute.of(context)?.settings.name) {
      Navigator.pushReplacementNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) => _onItemTapped(context, index),
          selectedItemColor: Color(0xFF346CBD),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: "Fatura"),
            BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Cartão"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Shop"),
          ],
        ),
      ),
    );
  }
}
