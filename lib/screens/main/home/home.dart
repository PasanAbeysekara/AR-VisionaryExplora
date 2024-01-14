import 'package:animate_do/animate_do.dart';
import 'package:ar_visionary_explora/components/custom_text.dart';
import 'package:ar_visionary_explora/screens/main/cart/cart.dart';
import 'package:ar_visionary_explora/screens/main/myhome/items.dart';
import 'package:ar_visionary_explora/screens/main/product_details/product_details.dart';
import 'package:ar_visionary_explora/utils/constants/app_assets.dart';
import 'package:ar_visionary_explora/utils/constants/app_colors.dart';
import 'package:ar_visionary_explora/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppAssets.menuIcon),
                InkWell(
                  onTap: () {
                    Helpers.navigateToPage(context, const Cart());
                  },
                  child: SvgPicture.asset(
                    AppAssets.cartIcon,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                "Furniture",
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(
              height: 41,
            ),
            //PRODUCT GRID
            ProductGrid(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("items")
            .orderBy("publishedDate", descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var products = snapshot.data!;
            return FadeInLeft(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 19,
                    mainAxisSpacing: 44,
                  ),
                  itemCount: products.docs.length,
                  itemBuilder: (context, index) {
                    Items eachItemInfo = Items.fromJson(
                        products.docs[index].data() as Map<String, dynamic>);
                    return ProductTile(
                      // product: products[index]
                      itemsInfo: eachItemInfo,
                      context: context,
                    );
                  }),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  // final Product product;
  final Items? itemsInfo;
  final BuildContext? context;

  // const ProductTile({required this.product});

  ProductTile({
    this.itemsInfo,
    this.context,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Helpers.navigateToPage(context,
            ProductDetails(index: itemsInfo?.itemID ?? "1704364391579"));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(itemsInfo?.itemImage ??
                'https://example.com/default_image.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite_border,
                color: AppColors.ash,
              ),
            ),
            Container(
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 60,
                    child: CustomText(
                      itemsInfo?.itemName ?? "default name",
                      fontSize: 15,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CustomText(
                    itemsInfo?.itemPrice ?? "0",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
