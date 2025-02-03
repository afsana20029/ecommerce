import 'package:ecommerce/features/creatReview/ui/screens/create_review_screen.dart';
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
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    elevation: 1,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(
                                width: 4,
                              ),
                              Text('Rabbil Hasan'),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet consectetur, adipisicing elitDeserunt, obcaecati aspernatur libero rerum odit natus eius",
                            style: textTheme.titleSmall
                                ?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          _buildReviewsSection(textTheme),
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
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              onPressed: () {
                Navigator.pushNamed(context, CreateReviewScreen.name);
              },
              child: const Text(
                '+',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context) {
    Navigator.pop(context);
  }
}
