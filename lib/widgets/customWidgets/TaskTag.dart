import 'package:flutter/material.dart';

class TaskTag extends StatelessWidget {
  final String name;
  const TaskTag({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 1),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(name, style: TextStyle(color: Colors.grey, fontSize: 12)),
    );
  }
}
