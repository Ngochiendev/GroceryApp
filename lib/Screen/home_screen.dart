import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/ultils/text_ultils.dart';
import 'package:groceryapp/ultils/ultils.dart';
import 'package:groceryapp/widget/items_widget.dart';
import 'package:groceryapp/widget/onSale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _listImage = [
    './assets/images/offres/Offer1.jpg',
    './assets/images/offres/Offer2.jpg',
    './assets/images/offres/Offer3.jpg',
    './assets/images/offres/Offer4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Ultils(context).getTheme;
    final size = Ultils(context).size;
    final Color color = Ultils(context).color;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              width: size.width,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _listImage[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: _listImage.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.blueAccent,
                  ),
                ),
                control: const SwiperControl(),
              ),
            ),
            const SizedBox(height: 5),
            //Sale product
            TextButton(
              onPressed: () {
                print("View all Sale");
              },
              child: TextUltils(
                text: 'View all',
                color: Colors.blue,
                maxLines: 1,
                textSize: 18,
              ),
            ),
            Row(
              children: [
                //Hướng của chữ on sale
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextUltils(
                        text: 'on sale'.toUpperCase(),
                        color: Colors.redAccent,
                        textSize: 25,
                        isTitle: true,
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const OnSaleWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //Product
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUltils(
                    text: 'Our Products',
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  TextButton(
                    onPressed: () {
                      print("Browse all");
                    },
                    child: TextUltils(
                      text: 'Browse all',
                      color: Colors.blue,
                      maxLines: 1,
                      textSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: size.width / (size.height * 0.50),
                children: List.generate(
                  4,
                  (index) => const ItemsWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
