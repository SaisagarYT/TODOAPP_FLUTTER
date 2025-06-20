import 'package:flutter/material.dart';

class TaskType extends StatelessWidget {
  final String type;
  final Icon icon;
  final int count;
  final Color colors;
  final Color iconColor;
  const TaskType({
    super.key,
    required this.count,
    required this.icon,
    required this.type,
    required this.colors,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: 90,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon.icon, color: iconColor),
            Row(
              children: [
                Text(
                  count.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(type),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
