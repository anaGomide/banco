import 'package:flutter/material.dart';

import '../models/card_model.dart';
import '../models/trasaction_model.dart';

class CardViewModel {
  final ValueNotifier<int> selectedCardIndex = ValueNotifier<int>(0);

  final List<CardModel> _cards = [
    CardModel(
      id: "1",
      lastDigits: "5621",
      name: "GS3 TEC",
      availableLimit: 7867.80,
      bestPurchaseDay: 20,
      transactions: [
        TransactionModel(title: "Apple Store", date: "05/09 às 22:35", amount: 545.99, type: "Saída", category: "Eletrônicos"),
        TransactionModel(title: "Uber Trip", date: "05/09 às 15:25", amount: 12.96, type: "Saída", category: "Transporte"),
        TransactionModel(title: "Carrefour", date: "03/09 às 09:34", amount: 349.76, type: "Saída", category: "Supermercado"),
      ],
    ),
    CardModel(
      id: "2",
      lastDigits: "9876",
      name: "Visa Gold",
      availableLimit: 4520.00,
      bestPurchaseDay: 15,
      transactions: [
        TransactionModel(title: "Netflix", date: "06/09 às 21:00", amount: 39.90, type: "Saída", category: "Entretenimento"),
        TransactionModel(title: "McDonald's", date: "06/09 às 12:45", amount: 25.50, type: "Saída", category: "Alimentação"),
        TransactionModel(title: "Farmácia", date: "05/09 às 10:30", amount: 78.90, type: "Saída", category: "Saúde"),
      ],
    ),
  ];

  List<CardModel> get cards => _cards;

  CardModel get selectedCard => _cards[selectedCardIndex.value];

  void changeCard(int index) {
    selectedCardIndex.value = index;
  }
}
