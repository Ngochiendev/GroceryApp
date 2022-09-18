import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/Screen/cart/cart_widget.dart';
import 'package:groceryapp/services/global_method.dart';
import 'package:groceryapp/ultils/text_ultils.dart';
import 'package:groceryapp/ultils/ultils.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Ultils(context).color;
    Size size = Ultils(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextUltils(
            text: 'Cart (2)',
            color: color,
            isTitle: true,
            textSize: 22,
          ),
          actions: [
            IconButton(
              onPressed: () {
                GlobalMethods.WarningDialog(
                  context: context,
                  title: 'Empty your cart',
                  subtitle: 'Are you sure?',
                  function: () {
                    print('clear cart');
                  },
                );
              },
              icon: Icon(
                IconlyBroken.delete,
                color: color,
              ),
            ),
          ]),
      body: Column(
        children: [
          _checkout(ctx: context),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, index) {
                return const CartWidget();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkout({required BuildContext ctx}) {
    final Color color = Ultils(ctx).color;
    Size size = Ultils(ctx).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.1,
      // color: ,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(children: [
          Material(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextUltils(
                  text: 'Order Now',
                  textSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
          FittedBox(
              child: TextUltils(
            text: 'Total: \$0.259',
            color: color,
            textSize: 18,
            isTitle: true,
          ))
        ]),
      ),
    );
  }
}
