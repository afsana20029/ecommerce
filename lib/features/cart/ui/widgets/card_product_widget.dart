import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';
import '../../../common/ui/widgets/product_inc_dec_button.dart';


class cardProductWidget extends StatelessWidget {
  const cardProductWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          children: [
            Image.asset(
              AssetsPath.dummyImagePng,
              width: 90,
              height: 90,
              fit: BoxFit.scaleDown,
            ),
            Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text('Nike shoe - AK45637 New Year deal',
                                  maxLines: 1,
                                  style: textTheme.bodyLarge?.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Row(
                                children: [
                                  Text('Color:red'),
                                  SizedBox(width: 8),
                                  Text('Size:XL'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_forever_outlined),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$100",
                          style: textTheme.titleSmall
                              ?.copyWith(color: AppColors.themeColor),
                        ),
                        ProductQuantityIncDecButton(
                          onChange: (int noOfItem) {},
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}