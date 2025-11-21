import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/order_cubit.dart';
import 'pages/order_home_page.dart';

void main() {
  runApp(const WarungApp());
}

class WarungApp extends StatelessWidget {
  const WarungApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Warung Mang Diyan",
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.orange,
        ),
        home: const OrderHomePage(),
      ),
    );
  }
}
