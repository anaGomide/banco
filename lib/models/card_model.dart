import 'trasaction_model.dart';

class CardModel {
  final String id;
  final String lastDigits;
  final String name;
  final double availableLimit;
  final int bestPurchaseDay;
  final List<TransactionModel> transactions;

  CardModel({
    required this.id,
    required this.lastDigits,
    required this.name,
    required this.availableLimit,
    required this.bestPurchaseDay,
    required this.transactions,
  });
}
