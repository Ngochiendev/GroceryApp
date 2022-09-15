import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/ultils/ultils.dart';

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
    final themeState = Utils(context).getTheme;
    final size = Utils(context).size;
    return Scaffold(
      body: SizedBox(
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
    );
  }
}
