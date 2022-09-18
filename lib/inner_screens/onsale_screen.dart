import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/ultils/ultils.dart';
import 'package:groceryapp/widget/onSale_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Ultils(context).size;
    final color = Ultils(context).color;
    const bool isEmpty = false;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(IconlyLight.arrowLeft2, color: color),
        ),
        title: Text(
          'On Sale Products',
          style: TextStyle(color: color, fontWeight: FontWeight.w600),
        ),
      ),
      body: isEmpty
          ? const Center(
              child: Text('No Product OnSale'),
            )
          : GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: size.width / (size.height * 0.50),
              children: List.generate(
                16,
                (index) => const OnSaleWidget(),
              ),
            ),
    );
  }
}
