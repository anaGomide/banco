import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/trasaction_model.dart';
import '../viewmodels/card_viewmodel.dart';
import '../widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardViewModel _cardViewModel = CardViewModel();
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3C6AB2), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.4, 0.6],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "Olá, Cliente",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 180.h,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _cardViewModel.changeCard(index);
                  });
                },
                itemCount: _cardViewModel.cards.length,
                itemBuilder: (context, index) {
                  return CardWidget(
                    card: _cardViewModel.cards[index],
                    isSelected: index == _cardViewModel.selectedCardIndex.value,
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Últimos lançamentos",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<int>(
                valueListenable: _cardViewModel.selectedCardIndex,
                builder: (context, index, _) {
                  List<TransactionModel> transactions = _cardViewModel.cards[index].transactions;
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    itemCount: transactions.length,
                    itemBuilder: (context, i) {
                      return _transactionItem(transactions[i]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _transactionItem(TransactionModel transaction) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24.r,
        backgroundColor: Colors.blue.shade100,
        child: Icon(Icons.monetization_on, color: Colors.blue.shade700, size: 22.sp),
      ),
      title: Text(transaction.title, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(transaction.date, style: Theme.of(context).textTheme.bodyMedium),
      trailing: Text(
        "R\$ ${transaction.amount.toStringAsFixed(2)}",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
