import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/ultils/text_ultils.dart';
import 'package:groceryapp/ultils/ultils.dart';
import 'package:groceryapp/widget/items_widget.dart';

class AllItemsScreen extends StatefulWidget {
  static const routeName = "/AllItemsScreen";

  const AllItemsScreen({super.key});

  @override
  State<AllItemsScreen> createState() => _AllItemsScreenState();
}

class _AllItemsScreenState extends State<AllItemsScreen> {
  final TextEditingController searchTextController = TextEditingController();
  final FocusNode searchTextFocusNode = FocusNode();

  @override
  void dispose() {
    searchTextController.dispose();
    searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Ultils(context).color;
    Size size = Ultils(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: TextUltils(
          text: 'All Products',
          color: color,
          textSize: 20.0,
          isTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TextField(
                  focusNode: searchTextFocusNode,
                  controller: searchTextController,
                  onChanged: (valuee) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.greenAccent, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.greenAccent, width: 1),
                    ),
                    hintText: "What's in your mind",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: searchTextController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              searchTextController.clear();
                              searchTextFocusNode.unfocus();
                            },
                            icon: Icon(
                              Icons.close,
                              color: searchTextFocusNode.hasFocus
                                  ? Colors.red
                                  : color,
                            ),
                          )
                        : null,
                    isDense: true,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                padding: EdgeInsets.zero,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: size.width / (size.height * 0.59),
                children: List.generate(10, (index) {
                  return const ItemsWidget();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
