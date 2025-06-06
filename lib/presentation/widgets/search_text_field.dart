import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * 0.8,
      child: TextField(
        decoration: InputDecoration(
          hint: Row(children: [Icon(Icons.search), Text("Search")]),
          filled: true,
          fillColor:
              Colors.grey[200], // Background color (from your previous request)
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.grey), // Default border color
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Colors.grey,
            ), // Border color when not focused
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Colors.grey,
            ), // Border color when focused
          ),
        ),
      ),
    );
  }
}
