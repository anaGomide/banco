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
        TransactionModel(title: "Apple Store", date: "2024/05/09 22:35", amount: 545.99, category: "Eletrônicos", installments: 12),
        TransactionModel(title: "Uber Trip", date: "2024/05/09 15:25", amount: 12.96, category: "Transporte"),
        TransactionModel(title: "Carrefour", date: "2024/03/09 09:34", amount: 349.76, category: "Supermercado", installments: 3),
      ],
    ),
    CardModel(
      id: "2",
      lastDigits: "9876",
      name: "Visa Gold",
      availableLimit: 4520.00,
      bestPurchaseDay: 15,
      transactions: [
        TransactionModel(title: "Netflix", date: "2024/06/09 21:00", amount: 39.90, category: "Entretenimento"),
        TransactionModel(title: "McDonald's", date: "2024/06/09 12:45", amount: 25.50, category: "Alimentação"),
        TransactionModel(title: "Farmácia", date: "2024/05/09 10:30", amount: 78.90, category: "Saúde", installments: 2),
      ],
    ),
  ];

  List<CardModel> get cards => _cards;

  CardModel get selectedCard => _cards[selectedCardIndex.value];

  void changeCard(int index) {
    selectedCardIndex.value = index;
  }
}
