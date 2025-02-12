import 'package:flutter/material.dart';

import '../widgets/bottom_navbar_widget.dart';

class ShopPage extends StatelessWidget {
  static const String routeName = '/shop';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Shop", style: Theme.of(context).textTheme.headlineMedium)),
      bottomNavigationBar: BottomNavBar(selectedIndex: 3),
    );
  }
}
