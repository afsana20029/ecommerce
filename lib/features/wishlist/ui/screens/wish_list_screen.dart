import 'package:ecommerce/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/ui/controllers/main_bottom_nav_controller.dart';
import '../../../common/ui/widgets/product_item_widget.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (popResult) => _onTap,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Wishlist'),
            leading: IconButton(onPressed: (){
              _onTap();
            },
              icon: const Icon(Icons.arrow_back_ios),),
          ),
          body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 4),
              itemCount: 20,
              itemBuilder: (context, index) {
                return const FittedBox(child: ProductItemWidget());
              })),
    );
  }
  void _onTap() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
