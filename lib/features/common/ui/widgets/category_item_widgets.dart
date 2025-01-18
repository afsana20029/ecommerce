import 'package:ecommerce/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name,arguments: 'Computer');
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.09),
                borderRadius: BorderRadius.circular(8)),
            child: const Icon(
              Icons.computer,
              color: AppColors.themeColor,
              size: 40,
            ),
          ),
          const Text(
            'Computer',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,

                color: AppColors.themeColor),
          )
        ],
      ),
    );
  }
}