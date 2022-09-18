import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/Screen/viewed_recently/viewed_widget.dart';
import 'package:groceryapp/services/global_method.dart';
import 'package:groceryapp/ultils/text_ultils.dart';
import 'package:groceryapp/ultils/ultils.dart';
import 'package:groceryapp/widget/backwidget.dart';

import '../../widget/empty_screen.dart';

class ViewedRecentlyScreen extends StatefulWidget {
  static const routeName = '/ViewedRecentlyScreen';

  const ViewedRecentlyScreen({Key? key}) : super(key: key);

  @override
  _ViewedRecentlyScreenState createState() => _ViewedRecentlyScreenState();
}

class _ViewedRecentlyScreenState extends State<ViewedRecentlyScreen> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    Color color = Ultils(context).color;
    // Size size = Utils(context).getScreenSize;
    const isEmpty = true;
    return isEmpty
        ? const EmptyScreen(
            title: 'You didnt place any order yet',
            subtitle: 'order something and make me happy :)',
            buttonText: 'Shop now',
            imagePath: 'assets/images/cart.png',
          )
        : Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.WarningDialog(
                        title: 'Empty your history?',
                        subtitle: 'Are you sure?',
                        function: () {},
                        context: context);
                  },
                  icon: Icon(
                    IconlyBroken.delete,
                    color: color,
                  ),
                )
              ],
              leading: const BackWidget(),
              automaticallyImplyLeading: false,
              elevation: 0,
              centerTitle: true,
              title: TextUltils(
                text: 'History',
                color: color,
                textSize: 24.0,
              ),
              backgroundColor:
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
            ),
            body: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                    child: ViewedRecentlyWidget(),
                  );
                }),
          );
  }
}
