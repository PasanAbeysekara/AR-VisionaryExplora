import 'package:ar_visionary_explora/components/custom_text.dart';
import 'package:ar_visionary_explora/components/cutomer_button.dart';
import 'package:ar_visionary_explora/screens/main/cart/widgets/cart_amount.dart';
import 'package:ar_visionary_explora/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BottomRaw extends StatelessWidget {
  const BottomRaw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 40),
      color: AppColors.lightGreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 8,
          ),
          CartAmmountRaw(
            name: "Product Price",
            ammount: "LKR. 120,000",
          ),
          const SizedBox(
            height: 8,
          ),
          CartAmmountRaw(
            name: "Discount",
            ammount: "LKR. 10,000",
          ),
          const SizedBox(
            height: 8,
          ),
          CartAmmountRaw(
            name: "Tax",
            ammount: "LKR. 5,000",
          ),
          const SizedBox(
            height: 8,
          ),
          CartAmmountRaw(
            name: "Total Price",
            ammount: "LKR. 115,000",
            isTotal: true,
          ),
          CustomButton(
            text: "Place Order",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
