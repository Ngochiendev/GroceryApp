import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/inner_screens/product_detail.dart';
import 'package:groceryapp/services/global_method.dart';
import 'package:groceryapp/ultils/text_ultils.dart';
import 'package:groceryapp/ultils/ultils.dart';
import 'package:groceryapp/widget/heart_button.dart';
import 'package:groceryapp/widget/price_widget.dart';

class OnSaleWidget extends StatelessWidget {
  const OnSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Ultils(context).color;
    final theme = Ultils(context).getTheme;
    Size size = Ultils(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            GlobalMethods.navigatetor(
                context: context, routeName: ProductDetails.routeName);
            print("product");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FancyShimmerImage(
                        imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                        width: size.width * 0.24,
                        height: size.width * 0.24,
                        boxFit: BoxFit.fill,
                      ),
                      // Image.network(
                      //   'https://i.ibb.co/F0s3FHQ/Apricots.png',
                      //   // width: size.width*0.22,
                      //   height: size.width * 0.24,
                      //   fit: BoxFit.fill,
                      // ),
                      Column(
                        children: [
                          TextUltils(
                            text: '1KG',
                            color: color,
                            textSize: 20,
                            isTitle: true,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  IconlyLight.bag2,
                                  size: 22,
                                  color: color,
                                ),
                              ),
                              const HeartButton(),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  const PriceWidget(
                    price: 2.99,
                    salePrice: 2.0,
                    isOnSale: true,
                    textPrice: '1',
                  ),
                  const SizedBox(height: 8),
                  TextUltils(
                    text: 'Product title',
                    color: color,
                    textSize: 16,
                    isTitle: true,
                  ),
                  const SizedBox(height: 5),
                ]),
          ),
        ),
      ),
    );
  }
}
