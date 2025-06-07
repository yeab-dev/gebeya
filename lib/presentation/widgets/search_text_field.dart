import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gebeya/presentation/bloc/inventory_bloc.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        return SizedBox(
          width: width * 0.8,
          child: TextField(
            onChanged: (value) {
              context.read<InventoryBloc>().add(
                InventoryFilterBySearchStarted(searchQuery: value),
              );
            },
            decoration: InputDecoration(
              hint: Row(children: [Icon(Icons.search), Text("Search")]),
              filled: true,
              fillColor: Colors
                  .grey[200], // Background color (from your previous request)
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: Colors.grey,
                ), // Default border color
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
      },
    );
  }
}
