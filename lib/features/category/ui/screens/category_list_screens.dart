import 'package:ecommerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui/widgets/category_item_widgets.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});
  static const String name = '/category-list-screen';
  @override
  Widget build(BuildContext context) {

    return PopScope(
      canPop: false,
      onPopInvoked: (popResult) => onTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category list'),
          leading: IconButton(
              onPressed: onTap, icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 2, mainAxisSpacing: 8),
            itemBuilder: (context, index) {
              return const FittedBox(child: CategoryItemWidget());
            }),
      ),
    );
  }
  void onTap() {
    Get.find<MainBottomNavController>().backToHome();
  }

}
