import 'package:ar_visionary_explora/components/common_back_button.dart';
import 'package:ar_visionary_explora/components/custom_text.dart';
import 'package:ar_visionary_explora/components/cutomer_button.dart';
import 'package:ar_visionary_explora/screens/main/myhome/items.dart';
import 'package:ar_visionary_explora/screens/main/product_details/widgets/related_item_type.dart';
import 'package:ar_visionary_explora/utils/constants/app_assets.dart';
import 'package:ar_visionary_explora/utils/constants/app_colors.dart';
import 'package:ar_visionary_explora/utils/helpers/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String index;
  const ProductDetails({super.key, required this.index});

  @override
  State<ProductDetails> createState() => _ProductDetailsState(index: index);
}

class _ProductDetailsState extends State<ProductDetails> {
  final String index;

  _ProductDetailsState({required this.index});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("items")
            .orderBy("publishedDate", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Items itemsInfo = Items.fromJson(snapshot.data!.docs
                .firstWhere((doc) => doc['itemID'] == index)
                .data());

            print(itemsInfo);

            return SizedBox(
              width: SizeConfig.w(context),
              height: SizeConfig.h(context),
              child: Stack(
                children: [
                  UpperSection(itemsInfo: itemsInfo),
                  Positioned(
                    top: 256,
                    child: ProductDetailsSection(itemsInfo: itemsInfo),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ProductDetailsSection extends StatelessWidget {
  final Items? itemsInfo;
  final BuildContext? context;

  ProductDetailsSection({
    this.itemsInfo,
    this.context,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                itemsInfo?.itemName ?? "default name",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              const COunterSection(),
            ],
          ),
          const SizedBox(
            height: 21,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              itemsInfo?.itemPrice ?? "0",
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          CustomText(
            itemsInfo?.itemDescription ??
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
  final Items? itemsInfo;
  final BuildContext? context;

  UpperSection({
    this.itemsInfo,
    this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: SizeConfig.w(context),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        image: DecorationImage(
          image: NetworkImage(
              itemsInfo?.itemImage ?? 'https://example.com/default_image.jpg'),
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
