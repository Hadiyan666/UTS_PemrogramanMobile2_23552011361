import 'package:flutter/material.dart';
import 'order_summary_page.dart';
import 'category_stack_page.dart';

class OrderHomePage extends StatelessWidget {
  const OrderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // =============================
      //           APP BAR
      // =============================
      appBar: AppBar(
        backgroundColor: Colors.black,     // HEADER HITAM
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.3),
        centerTitle: true,

        // ===== TITLE GRADIENT =====
        title: ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                Colors.cyan,
                Colors.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: const Text(
            "Warung Mang Diyan",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Tetap dibutuhkan meski di-mask
            ),
          ),
        ),

        // ===== ICON KERANJANG =====
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const OrderSummaryPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),

      // =============================
      //           BODY
      // =============================
      body: const CategoryStackPage(),
    );
  }
}
