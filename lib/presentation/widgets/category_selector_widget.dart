import 'package:flutter/material.dart';

class CategorySelectorWidget extends StatefulWidget {
  final String category;
  const CategorySelectorWidget({super.key, required this.category});

  @override
  State<CategorySelectorWidget> createState() => _CategorySelectorWidgetState();
}

class _CategorySelectorWidgetState extends State<CategorySelectorWidget> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    final category = widget.category;
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: width / 4,
            height: height / 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: selected ? Colors.orange : Colors.grey.shade100,
            ),
            child: Text(category),
          ),
          SizedBox(width: width / 50),
        ],
      ),
    );
  }
}
