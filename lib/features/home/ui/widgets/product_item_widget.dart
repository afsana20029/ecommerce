import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.themeColor.withOpacity(0.12),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Image.asset(
                  'assets/images/nike_shoe.png',
                  width: 140,
                  height: 80,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: [
                  Text(
                    'Nike shoe latest edition- RF45GH',
                    maxLines: 1,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                  const SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('\$100',style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color:AppColors.themeColor,
                      ),),
                      Wrap(
                        children: [
                          const Icon(Icons.star,color: Colors.amber,size: 18,),
                          const Text('4.5',style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:AppColors.themeColor,
                          ),),
                          const SizedBox(width: 16,),
                          Container(
                            padding:const EdgeInsets.all(4) ,
                            decoration: BoxDecoration(
                              color: AppColors.themeColor,
                              borderRadius:BorderRadius.circular(4),
                            ),
                            child: const Icon(Icons.favorite_border,size: 14,color:Colors.white,),
                          )
                        ],
                      )
                    ],
                  )
                ]),
              )
            ],
          )),
    );
  }
}