import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/card_model.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;
  final bool isSelected;

  CardWidget({required this.card, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.all(20.w),
      width: 320.w,
      height: 180.h,
      decoration: BoxDecoration(
        gradient: isSelected
            ? LinearGradient(
                colors: [Color(0xFF2B66BC), Color(0xFF132D55)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: [Colors.grey.shade300, Colors.grey.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: Colors.blue.shade300.withOpacity(0.5),
              blurRadius: 8.r,
              spreadRadius: 2.r,
              offset: Offset(0, 4),
            ),
        ],
      ),
      child: SizedBox.expand(
        // 🔹 Evita que o conteúdo ultrapasse o Container
        child: Column(
          mainAxisSize: MainAxisSize.min, // 🔹 Faz com que a Column ocupe apenas o espaço necessário
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.credit_card, color: Colors.white, size: 56.sp),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "•••• ${card.lastDigits}",
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                    ),
                    Text(
                      card.name,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
                SizedBox(width: 100.w),
                Icon(Icons.remove_red_eye_outlined, color: Colors.white70, size: 28.sp),
              ],
            ),

            SizedBox(height: 5.h), // 🔹 Reduz o espaçamento para evitar overflow
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Limite disponível", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white70)),
                    Text("R\$ ${card.availableLimit.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Melhor dia de compra", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white70)),
                    Text("${card.bestPurchaseDay}", style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
