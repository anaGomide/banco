class TransactionModel {
  final String title;
  final String date;
  final double amount;
  final String category;
  final int? installments;

  TransactionModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
    this.installments,
  });
}
