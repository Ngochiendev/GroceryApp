import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryapp/inner_screens/product_detail.dart';
import 'package:groceryapp/services/global_method.dart';
import 'package:groceryapp/ultils/text_ultils.dart';
import 'package:groceryapp/ultils/ultils.dart';
import 'package:groceryapp/widget/heart_button.dart';
import 'package:groceryapp/widget/price_widget.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Ultils(context).color;
    Size size = Ultils(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            GlobalMethods.navigatetor(
                context: context, routeName: ProductDetails.routeName);
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(children: [
            FancyShimmerImage(
              imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
              height: size.width * 0.21,
              width: size.width * 0.2,
              boxFit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUltils(
                    text: 'Title',
                    color: color,
                    textSize: 20,
                    isTitle: true,
                  ),
                  const HeartButton(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: PriceWidget(
                      salePrice: 2.99,
                      price: 5.9,
                      textPrice: _quantityTextController.text,
                      isOnSale: true,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: FittedBox(
                            child: TextUltils(
                              text: 'KG',
                              color: color,
                              textSize: 18,
                              isTitle: true,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                            flex: 2,
                            // TextField can be used also instead of the textFormField
                            child: TextFormField(
                              controller: _quantityTextController,
                              key: const ValueKey('10'),
                              style: TextStyle(color: color, fontSize: 18),
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              enabled: true,
                              onChanged: (valueee) {
                                setState(() {});
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp('[0-9.]'),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).cardColor),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                      ),
                    )),
                child: TextUltils(
                  text: 'Add to cart',
                  maxLines: 1,
                  color: color,
                  textSize: 20,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
