import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteOptions extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {"icon": Icons.alternate_email, "label": "Cartão virtual"},
    {"icon": Icons.add_card, "label": "Cartão adicional"},
    {"icon": Icons.security, "label": "Seguros"},
    {"icon": Icons.card_giftcard, "label": "Pacotes"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Meus favoritos",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Row(
                children: [
                  Text(
                    "Personalizar",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(width: 5.w),
                  Icon(Icons.grid_view, color: Colors.blue.shade700, size: 18.sp),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 80.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: options.length,
              separatorBuilder: (context, _) => SizedBox(width: 15.w),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(101, 229, 229, 229),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Icon(
                        options[index]["icon"],
                        size: 28.sp,
                        color: Color(0xFF346CBD),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      options[index]["label"],
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
