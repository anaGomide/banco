import 'package:flutter/material.dart';

import '../widgets/bottom_navbar_widget.dart';

class CardPage extends StatelessWidget {
  static const String routeName = '/card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Cartão", style: Theme.of(context).textTheme.headlineMedium)),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2), // 🔹 Índice 2 para Cartão
    );
  }
}
