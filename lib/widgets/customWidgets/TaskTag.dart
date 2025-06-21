import 'package:flutter/material.dart';

class TaskTag extends StatelessWidget {
  final String name;
  final bool isSelected;
  final Color selectedColor;
  const TaskTag({
    super.key,
    required this.name,
    required this.isSelected,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 1),
      decoration: BoxDecoration(
        color: isSelected ? selectedColor : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }
}
