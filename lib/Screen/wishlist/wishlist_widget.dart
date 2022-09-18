import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/inner_screens/product_detail.dart';
import 'package:groceryapp/services/global_method.dart';
import 'package:groceryapp/ultils/text_ultils.dart';
import 'package:groceryapp/ultils/ultils.dart';
import 'package:groceryapp/widget/heart_button.dart';


class WishlistWidget extends StatelessWidget {
  const WishlistWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Ultils(context).color;
    Size size = Ultils(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          GlobalMethods.navigatetor(
              context: context, routeName: ProductDetails.routeName);
        },
        child: Container(
          height: size.height * 0.20,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8),
                width: size.width * 0.2,
                height: size.width * 0.25,
                child: FancyShimmerImage(
                  imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                  boxFit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            IconlyLight.bag2,
                            color: color,
                          ),
                        ),
                        const HeartButton(),
                      ],
                    ),
                  ),
                  Flexible(
                    child: TextUltils(
                      text: 'Title',
                      color: color,
                      textSize: 20.0,
                      maxLines: 2,
                      isTitle: true,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUltils(
                    text: '\$2.59',
                    color: color,
                    textSize: 18.0,
                    maxLines: 1,
                    isTitle: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
