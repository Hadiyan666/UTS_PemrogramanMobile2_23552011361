import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import '../widgets/menu_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/order_cubit.dart';

class CategoryStackPage extends StatefulWidget {
  const CategoryStackPage({super.key});

  @override
  State<CategoryStackPage> createState() => _CategoryStackPageState();
}

class _CategoryStackPageState extends State<CategoryStackPage> {
  String selectedCategory = "makanan";

  final List<MenuModel> menus = [
    MenuModel(id: "1", name: "Nasi Goreng", price: 15000, category: "makanan", discount: 0.1),
    MenuModel(id: "2", name: "Mie Ayam", price: 12000, category: "makanan", discount: 0.05),
    MenuModel(id: "3", name: "Es Teh", price: 5000, category: "minuman", discount: 0.2),
    MenuModel(id: "4", name: "Kopi Hitam", price: 7000, category: "minuman", discount: 0.1),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredMenu = menus.where((m) => m.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Kategori Menu")),
      body: Stack(
        children: [
          // Daftar menu
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: ListView.builder(
              itemCount: filteredMenu.length,
              itemBuilder: (context, index) {
                return MenuCard(
                  menu: filteredMenu[index],
                  onAdd: () => context.read<OrderCubit>().addToOrder(filteredMenu[index]),
                );
              },
            ),
          ),

          // Tombol kategori
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text("Makanan"),
                  selected: selectedCategory == "makanan",
                  onSelected: (_) => setState(() => selectedCategory = "makanan"),
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text("Minuman"),
                  selected: selectedCategory == "minuman",
                  onSelected: (_) => setState(() => selectedCategory = "minuman"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
