import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryapp/ultils/text_ultils.dart';
import 'package:groceryapp/ultils/ultils.dart';
import 'package:groceryapp/widget/heart_button.dart';
import 'package:groceryapp/widget/price_widget.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({super.key});

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
    final size = Ultils(context).size;
    final color = Ultils(context).color;

    return Material(
      borderRadius: BorderRadius.circular(18),
      color: Theme.of(context).cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {},
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
              width: size.width * 0.21,
              height: size.width * 0.2,
              boxFit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUltils(
                    text: 'Title', color: color, textSize: 18, isTitle: true),
                const HeartButton(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceWidget(
                  price: 99,
                  salePrice: 2.0,
                  isOnSale: false,
                  textPrice: _quantityTextController.text,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    children: [
                      TextUltils(
                        text: 'KG',
                        color: color,
                        textSize: 16,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        // _quantityTextController.text = value;
                      });
                    },
                    controller: _quantityTextController,
                    key: const ValueKey('10'),
                    style: TextStyle(color: color, fontSize: 18),
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    enabled: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  print('add to cart');
                },
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                    color: color,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
