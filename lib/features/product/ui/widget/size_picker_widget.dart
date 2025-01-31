import 'dart:core';

import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class SizePickerWidget extends StatefulWidget {
  const SizePickerWidget({super.key, required this.sizes, required this.onSizeSelected});
  final List<String> sizes;
  final Function(String) onSizeSelected;
  @override
  State<SizePickerWidget> createState() => _SizePickerWidgetState();
}

class _SizePickerWidgetState extends State<SizePickerWidget> {
  String? _selectedColor;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _getSizeItems(),
      ),
    );
  }

  List<Widget> _getSizeItems() {
    List<Widget> colorItemWidgetListList = [];
    for (String size in widget.sizes) {
     Widget item = getSizeItemWidget(
          name: size,
          onTap: () {
            _selectedColor = size;
            setState(() {});
          },
          isSelected: _selectedColor == size);
     colorItemWidgetListList.add(item);
    }
    return colorItemWidgetListList;
  }

  Widget getSizeItemWidget(
      {required String name,
      required VoidCallback onTap,
      required bool isSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin:  const EdgeInsets.only(right: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(),
            color: isSelected ? AppColors.themeColor : Colors.transparent),
        child: Text(name,
            style: TextStyle(color: isSelected ? Colors.white : null)),
      ),
    );
  }
}
