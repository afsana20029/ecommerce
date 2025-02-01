import 'package:ecommerce/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});
  static const String name = '/reviews/reviews-screen';
  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
        leading: IconButton(
          onPressed: () => _onTap(context), // Pass context here
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(),
          ),
          _buildReviewsSection(textTheme)
        ],
      ),
    );
  }

  Container _buildReviewsSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Reviews (1000)', style: textTheme.titleSmall),
            ],
          ),
          SizedBox(
              width: 140,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder()
                ),
                  onPressed: () {},
                  child:Text('+',style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 24),), ))
        ],
      ),
    );
  }

  void _onTap(BuildContext context) {
    Navigator.pop(context);
  }
}
