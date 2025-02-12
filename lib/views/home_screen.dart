import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../models/trasaction_model.dart';
import '../viewmodels/card_viewmodel.dart';
import '../widgets/bottom_navbar_widget.dart';
import '../widgets/card_widget.dart';
import '../widgets/favorite_options.dart';
import 'trasaction_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardViewModel _cardViewModel = CardViewModel();
  late PageController _pageController;
  int _selectedIndex = 0;

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
            stops: [0.1, 0.5],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            spacing: 10,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.menu, color: Colors.white, size: 28.sp),
                  onPressed: () {},
                ),
                title: Text.rich(
                  TextSpan(
                    text: "Olá, ",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                    children: [
                      TextSpan(text: "Cliente", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.chat_bubble_outline, color: Colors.white, size: 26.sp),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Stack(
                      children: [
                        Icon(Icons.notifications_none, color: Colors.white, size: 26.sp),
                        Positioned(
                          right: 4,
                          top: 4,
                          child: CircleAvatar(radius: 4, backgroundColor: Colors.red),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
              Divider(color: Color.fromARGB(143, 255, 255, 255), height: 0.5),
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
              Divider(color: Colors.white, height: 0.5),
              FavoriteOptions(),
              Divider(color: Colors.grey.shade300),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Últimos lançamentos",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    GestureDetector(
                      onTap: () {
                        final transactions = _cardViewModel.selectedCard.transactions;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UltimosLancamentosScreen(transactions: transactions),
                          ),
                        );
                      },
                      child: Text(
                        "Ver Todos",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ValueListenableBuilder<int>(
                  valueListenable: _cardViewModel.selectedCardIndex,
                  builder: (context, index, _) {
                    List<TransactionModel> transactions = _cardViewModel.cards[index].transactions;
                    return _buildTransactionList(transactions);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
      ),
    );
  }

  Widget _buildTransactionList(List<TransactionModel> transactions) {
    Map<String, List<TransactionModel>> groupedTransactions = {};

    for (var transaction in transactions) {
      String formattedDate = _formatDate(transaction.date);
      if (!groupedTransactions.containsKey(formattedDate)) {
        groupedTransactions[formattedDate] = [];
      }
      groupedTransactions[formattedDate]!.add(transaction);
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
      itemCount: groupedTransactions.keys.length,
      itemBuilder: (context, index) {
        String dateKey = groupedTransactions.keys.elementAt(index);
        List<TransactionModel> transactionsForDate = groupedTransactions[dateKey]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
              child: Text(
                dateKey,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.blue.shade700),
              ),
            ),
            Column(
              children: transactionsForDate.map((transaction) {
                return Column(
                  children: [
                    _transactionItem(transaction),
                    Divider(color: Colors.grey.shade300), // 🔹 Mantendo divisores entre itens
                  ],
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  String _formatDate(String transactionDate) {
    DateTime date = DateFormat("yyyy/MM/dd HH:mm").parse(transactionDate);
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return "Hoje, ${DateFormat("dd MMM", "pt_BR").format(date)}";
    }
    return DateFormat("dd MMM", "pt_BR").format(date);
  }

  Widget _transactionItem(TransactionModel transaction) {
    return ListTile(
      leading: Container(
        width: 45.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: Color(0xFFE5E5E5).withOpacity(0.2),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Icon(
          _getTransactionIcon(transaction.category),
          size: 28.sp,
          color: Color(0xFF346CBD),
        ),
      ),
      title: Text(transaction.title, style: Theme.of(context).textTheme.labelMedium),
      subtitle: Text(transaction.date, style: Theme.of(context).textTheme.bodySmall),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "R\$ ${transaction.amount.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          if (transaction.installments != null) // 🔹 Exibe se houver parcelamento
            Text(
              "em ${transaction.installments}x",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
            ),
        ],
      ),
    );
  }

  IconData _getTransactionIcon(String category) {
    switch (category.toLowerCase()) {
      case "eletrônicos":
        return Icons.phone_iphone;
      case "transporte":
        return Icons.directions_car;
      case "supermercado":
        return Icons.shopping_cart;
      case "entretenimento":
        return Icons.movie;
      case "alimentação":
        return Icons.fastfood;
      case "saúde":
        return Icons.local_hospital;
      default:
        return Icons.category;
    }
  }
}
