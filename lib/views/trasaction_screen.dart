import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/trasaction_model.dart';
import '../widgets/bottom_navbar_widget.dart';

class UltimosLancamentosScreen extends StatelessWidget {
  static const String routeName = '/ultimos-lancamentos';
  final List<TransactionModel> transactions;

  const UltimosLancamentosScreen({required this.transactions, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Últimos Lançamentos"),
          backgroundColor: Color(0xFF3C6AB2),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: Theme.of(context).textTheme.headlineSmall),
      body: transactions.isEmpty
          ? Center(child: Text("Nenhuma transação encontrada."))
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              itemCount: transactions.length,
              separatorBuilder: (_, __) => Divider(color: Colors.grey.shade300),
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return _transactionItem(transaction, context);
              },
            ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
    );
  }

  Widget _transactionItem(TransactionModel transaction, BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
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
      title: Text(
        transaction.title,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      subtitle: Text(
        transaction.date,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "R\$ ${transaction.amount.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          if (transaction.installments != null)
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
