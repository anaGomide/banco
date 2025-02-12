import 'package:flutter/material.dart';

import '../widgets/bottom_navbar_widget.dart';

class FaturaPage extends StatelessWidget {
  static const String routeName = '/fatura';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Fatura", style: Theme.of(context).textTheme.headlineMedium)),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1), // 🔹 Índice 1 para Fatura
    );
  }
}
