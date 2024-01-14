import 'package:ar_visionary_explora/components/common_back_button.dart';
import 'package:ar_visionary_explora/components/custom_text.dart';
import 'package:ar_visionary_explora/screens/main/cart/widgets/bottom_raw.dart';
import 'package:ar_visionary_explora/screens/main/cart/widgets/cart_tile.dart';
import 'package:ar_visionary_explora/utils/constants/app_assets.dart';
import 'package:ar_visionary_explora/utils/constants/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonBackButton(),
                      CustomText(
                        "Cart",
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                      Icon(
                        Icons.abc,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, Index) {
                    return const CartTile();
                  },
                  separatorBuilder: (contex, Index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: 6,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomRaw(),
    );
  }
}
