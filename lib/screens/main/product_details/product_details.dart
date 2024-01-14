import 'package:ar_visionary_explora/components/common_back_button.dart';
import 'package:ar_visionary_explora/components/custom_text.dart';
import 'package:ar_visionary_explora/components/cutomer_button.dart';
import 'package:ar_visionary_explora/screens/main/product_details/widgets/related_item_type.dart';
import 'package:ar_visionary_explora/utils/constants/app_assets.dart';
import 'package:ar_visionary_explora/utils/constants/app_colors.dart';
import 'package:ar_visionary_explora/utils/helpers/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: SizeConfig.w(context),
        height: SizeConfig.h(context),
        child: Stack(
          children: [
            const UpperSection(),
            const Positioned(
              top: 256,
              child: ProductDetailsSection(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: "Add to Cart",
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: "Try AR View",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.w(context),
      height: SizeConfig.h(context),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34),
          topRight: Radius.circular(34),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(29, 34, 29, 0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                "Sofa",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              COunterSection(),
            ],
          ),
          const SizedBox(
            height: 21,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              "LKR. 120 000",
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          const CustomText(
            "loerieujdshfughdfuygdsufgudsg u sedugfdusgf usdgfuydsgfuy dufguds usdfgfruydsg dfghdsu  sdufg dsuf udsf sufgsdfugds ufdsuf udsf udsfgds dusfgds uufsdg udfgusd fgusdfisd",
            textAlign: TextAlign.justify,
            fontSize: 13,
          ),
          const SizedBox(
            height: 28,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              "Related item",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.dartBrown,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          SizedBox(
            height: 90,
            child: ListView.separated(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const RelatedItemTile();
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class COunterSection extends StatelessWidget {
  const COunterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.ash,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
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
    );
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: SizeConfig.w(context),
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        image: DecorationImage(
          image: NetworkImage(AppAssets.dummyImage),
          fit: BoxFit.cover,
        ),
      ),
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: CommonBackButton(),
        ),
      ),
    );
  }
}
