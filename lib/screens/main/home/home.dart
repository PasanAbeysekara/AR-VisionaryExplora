import 'package:animate_do/animate_do.dart';
import 'package:ar_visionary_explora/components/custom_text.dart';
import 'package:ar_visionary_explora/providers/auth_provider.dart';
import 'package:ar_visionary_explora/screens/main/cart/cart.dart';
import 'package:ar_visionary_explora/screens/main/myhome/items.dart';
import 'package:ar_visionary_explora/screens/main/product_details/product_details.dart';
import 'package:ar_visionary_explora/utils/constants/app_assets.dart';
import 'package:ar_visionary_explora/utils/constants/app_colors.dart';
import 'package:ar_visionary_explora/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  //  final Items? itemsInfo;
  // final BuildContext? context;

  // Home({
  //   this.itemsInfo,
  //   this.context,
  // });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                InkWell(
                  onTap: () {
                    Provider.of<AuthProvider>(context, listen: false).logOut();
                  },
                  child: SvgPicture.asset(AppAssets.menuIcon),
                ),
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

  Expanded ProductGrid() {
    return Expanded(
      child: FadeInLeft(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 19,
            mainAxisSpacing: 44,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ProductTile();
          },
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Helpers.navigateToPage(context, const ProductDetails());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(AppAssets.dummyImage),
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 60,
                    child: CustomText(
                      "Sofa",
                      fontSize: 15,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CustomText(
                    "Rs.120 000",
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
