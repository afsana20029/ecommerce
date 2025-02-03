
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_colors.dart';
import '../../../common/ui/controllers/main_bottom_nav_controller.dart';
import '../widgets/card_product_widget.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading: IconButton(
          onPressed: _onTap,
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return cardProductWidget(textTheme: textTheme);
              },
            ),
          ),
          _buildCheckOutSection(textTheme),
        ],
      ),
    );
  }

  void _onTap() {
    Get.find<MainBottomNavController>().backToHome();
  }

  Container _buildCheckOutSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('TotalPrice', style: textTheme.titleSmall),
              Text('\$1000039',
                  style: textTheme.titleMedium?.copyWith(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ))
            ],
          ),
          SizedBox(
              width: 140,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Checkout',
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }
}
