import 'package:flutter/material.dart';
import 'package:gebeya/domain/models/cart.dart';
import 'package:gebeya/domain/models/product.dart';
import 'package:gebeya/presentation/pages/home.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(CartAdapter());
  await Hive.openBox('inventory');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        primaryColor: Colors.orange,
        // useMaterial3: true,
      ),
    );
  }
}
