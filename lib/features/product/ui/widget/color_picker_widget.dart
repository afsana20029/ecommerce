import 'dart:core';

import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({super.key, required this.colors, required this.onColorSelected});
  final List<String> colors;
  final Function(String) onColorSelected;
  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  String? _selectedColor;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _getColorItems(),
      ),
    );
  }

  List<Widget> _getColorItems() {
    List<Widget> colorItemWidgetListList = [];
    for (String color in widget.colors) {
     Widget item = getColorItemWidget(
          name: color,
          onTap: () {
            _selectedColor = color;
            setState(() {});
          },
          isSelected: _selectedColor == color);
     colorItemWidgetListList.add(item);
    }
    return colorItemWidgetListList;
  }

  Widget getColorItemWidget(
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
