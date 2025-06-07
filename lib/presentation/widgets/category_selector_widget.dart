import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gebeya/domain/models/product_category.dart';
import 'package:gebeya/presentation/bloc/inventory_bloc.dart';

class CategorySelectorWidget extends StatefulWidget {
  final ProductCategory category;
  const CategorySelectorWidget({super.key, required this.category});

  @override
  State<CategorySelectorWidget> createState() => _CategorySelectorWidgetState();
}

class _CategorySelectorWidgetState extends State<CategorySelectorWidget> {
  @override
  Widget build(BuildContext context) {
    final category = widget.category;
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        ProductCategory? selectedCategory;
        if (state is InventoryLoadSuccess) {
          selectedCategory = state.category;
        }
        return GestureDetector(
          onTap: () {
            if (selectedCategory != category) {
              context.read<InventoryBloc>().add(
                InventoryFilterByCategoryStarted(productCategory: category),
              );
            } else {
              context.read<InventoryBloc>().add(
                InventoryFilterByCategoryStarted(
                  productCategory: ProductCategory.all,
                ),
              );
            }
          },
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: width / 4,
                height: height / 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: selectedCategory == category
                      ? Colors.orange
                      : Colors.grey.shade100,
                ),
                child: Text(category.name),
              ),
              SizedBox(width: width / 50),
            ],
          ),
        );
      },
    );
  }
}
