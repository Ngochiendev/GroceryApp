import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceryapp/Screen/auth/forget_pass.dart';
import 'package:groceryapp/Screen/auth/login.dart';
import 'package:groceryapp/Screen/auth/register.dart';
import 'package:groceryapp/Screen/orders/orders_screen.dart';
import 'package:groceryapp/Screen/viewed_recently/viewed_recently.dart';
import 'package:groceryapp/Screen/wishlist/wishlist_screen.dart';
import 'package:groceryapp/inner_screens/all_items.dart';
import 'package:groceryapp/inner_screens/onsale_screen.dart';
import 'package:groceryapp/inner_screens/product_detail.dart';
import 'package:groceryapp/provider/dark_theme_provider.dart';
import 'package:groceryapp/ultils/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  //rotation lock
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = true;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        )
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Grecory App',
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const LoginScreen(),
            routes: {
              OnSaleScreen.routeName: (context) => const OnSaleScreen(),
              AllItemsScreen.routeName: (context) => const AllItemsScreen(),
              ProductDetails.routeName: (context) => const ProductDetails(),
              WishlistScreen.routeName: (context) => const WishlistScreen(),
              OrdersScreen.routeName: (context) => const OrdersScreen(),
              ViewedRecentlyScreen.routeName: (context) =>
                  const ViewedRecentlyScreen(),
              LoginScreen.routeName: (context) => const LoginScreen(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              ForgetPasswordScreen.routeName: (context) =>
                  const ForgetPasswordScreen(),
            },
          );
        },
      ),
    );
  }
}
