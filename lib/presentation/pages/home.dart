import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gebeya/core/network/dio_client.dart';
import 'package:gebeya/data/repositories/cart_repository.dart';
import 'package:gebeya/data/repositories/product_repository.dart';
import 'package:gebeya/data/services/cart_service.dart';
import 'package:gebeya/data/services/product_service.dart';
import 'package:gebeya/presentation/bloc/inventory_bloc.dart';
import 'package:gebeya/presentation/widgets/category_selector_widget.dart';
import 'package:gebeya/presentation/widgets/product_card.dart';
import 'package:gebeya/presentation/widgets/search_text_field.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (_) => InventoryBloc(
        cartRepository: CartRepositoryImpl(service: CartService()),
        productRepository: ProductRepositoryImpl(
          service: ProductService(dio: DioClient().dio),
        ),
      )..add(InventoryLoadStarted()),
      child: Scaffold(
        appBar: AppBar(title: Text("Shop"), centerTitle: true),
        body: SafeArea(
          child: BlocBuilder<InventoryBloc, InventoryState>(
            builder: (context, state) {
              switch (state) {
                case InventoryLoadInitial():
                  return Center(child: CircularProgressIndicator());
                case InventoryLoadInProgress():
                  return Center(child: CircularProgressIndicator());
                case InventoryLoadSuccess():
                  return SizedBox(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SearchTextField(),
                        SizedBox(height: 10),
                        SizedBox(
                          width: width,
                          height: height / 15,

                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              CategorySelectorWidget(category: "men"),
                              CategorySelectorWidget(category: "women"),
                              CategorySelectorWidget(category: "jewelery"),
                              CategorySelectorWidget(category: "electtornics"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.74,
                          child: GridView.count(
                            mainAxisSpacing: height / 20,
                            crossAxisSpacing: width / 15,
                            crossAxisCount: 2,
                            children: state.products.map((product) {
                              return ProductCard(product: product);
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                case InventoryLoadFailure():
                  return Center(child: Text("something went wrong"));
              }
            },
          ),
        ),
      ),
    );
  }
}
