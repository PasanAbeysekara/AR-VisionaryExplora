import 'package:ar_visionary_explora/components/custom_text.dart';
import 'package:ar_visionary_explora/components/cutomer_button.dart';
import 'package:ar_visionary_explora/screens/main/cart/widgets/animated_dialog_box.dart';
import 'package:ar_visionary_explora/screens/main/cart/widgets/cart_amount.dart';
import 'package:ar_visionary_explora/utils/constants/app_assets.dart';
import 'package:ar_visionary_explora/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomRaw extends StatelessWidget {
  const BottomRaw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(horizontal: 30),
      color: AppColors.lightGreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CartAmmountRaw(
            name: "Product Price",
            ammount: "LKR. 120,000",
          ),
          const SizedBox(
            height: 12,
          ),
          CartAmmountRaw(
            name: "Discount",
            ammount: "LKR. 10,000",
          ),
          const SizedBox(
            height: 12,
          ),
          CartAmmountRaw(
            name: "Tax",
            ammount: "LKR. 5,000",
          ),
          const SizedBox(
            height: 12,
          ),
          const CartAmmountRaw(
            name: "Total Price",
            ammount: "LKR. 115,000",
            isTotal: true,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: "Place Order",
            onTap: () {
              showDialog(
                context: context,
                builder: (contex) {
                  return DialogBoxContent();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class DialogBoxContent extends StatelessWidget {
  const DialogBoxContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 300,
            height: 333,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.logo),
                const SizedBox(
                  height: 30,
                ),
                const CustomText(
                  "Thanks for Buying\nfrom Us...",
                  fontSize: 20,
                  color: AppColors.primaryColor,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -10,
            child: CustomButton(
              text: "See your order",
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
