import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/features/product/ui/widget/color_picker_widget.dart';
import 'package:ecommerce/features/product/ui/widget/product_image_carousel_slider.dart';
import 'package:ecommerce/features/product/ui/widget/product_inc_dec_button.dart';
import 'package:flutter/material.dart';

import '../widget/size_picker_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  static const String name = '/product/product-details';
  final int productId;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCarouselSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Nike Shoe A2ERF - New year special deal',
                                    style: textTheme.titleMedium,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 18,
                                          ),
                                          const Text(
                                            '4.5',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          TextButton(
                                              onPressed: () {},
                                              child: const Text('Reviews')),
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: AppColors.themeColor,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: const Icon(
                                              Icons.favorite_border,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              children: [
                                ProductQuantityIncDecButton(
                                  onChange: (int value) {},
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text('Color', style: textTheme.titleMedium),
                        const SizedBox(
                          height: 8,
                        ),
                        ColorPickerWidget(
                          colors: const ['Red', 'green', 'yellow', 'Pink'],
                          onColorSelected: (String selectedColor) {},
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text('Size', style: textTheme.titleMedium),
                        const SizedBox(
                          height: 8,
                        ),
                        SizePickerWidget(
                          sizes: const ['S', 'M', 'L', 'XL', 'XXL'],
                          onSizeSelected: (String selectedSize) {},
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text('Description', style: textTheme.titleMedium),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                            "Lorem ipsum dolor sit amet consectetur, adipisicing elit."
                                " Deserunt, obcaecati aspernatur libero rerum odit natus eius "
                                "reprehenderit ex aliquam laudantium labore sit ipsam error"
                                " doloremque quis ipsum inventore possimus? Inventore?",style:TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndToCartSection(textTheme)
        ],
      ),
    );
  }

  Container _buildPriceAndToCartSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Price', style: textTheme.titleSmall),
              Text('\$100',
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
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }
}
