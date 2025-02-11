class TransactionModel {
  final String title;
  final String date;
  final double amount;
  final String type; // "Entrada" ou "Saída"
  final String category;

  TransactionModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.type,
    required this.category,
  });
}
