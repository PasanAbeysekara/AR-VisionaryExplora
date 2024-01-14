import 'package:ar_visionary_explora/components/custom_text.dart';
import 'package:ar_visionary_explora/utils/constants/app_assets.dart';
import 'package:ar_visionary_explora/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.ash.withOpacity(.3),
            offset: const Offset(0, 2),
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadiusDirectional.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(15),
            child: Image.network(
              AppAssets.dummyImage,
              width: 70,
              height: 70,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                "Sofa",
                fontSize: 14,
              ),
              Row(
                children: [
                  InkWell(
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CustomText(
                    "1",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
              const CustomText(
                "LKR. 120,000",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ],
      ),
    );
  }
}
