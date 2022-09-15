import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/provider/dark_theme_provider.dart';
import 'package:groceryapp/ultils/text_ultils.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final TextEditingController _texteditingController = TextEditingController();
  @override
  void dispose() {
    _texteditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hi, ',
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'MyName',
                          style: TextStyle(
                            color: color,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('My name is pressed');
                            }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUltils(
                  text: 'Email@email.com',
                  color: color,
                  textSize: 18,
                  // isTitle: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                    thickness: 1,
                    color:
                        themeState.getDarkTheme ? Colors.white : Colors.grey),
                const SizedBox(height: 20),
                _listTile(
                  title: 'Address',
                  icon: IconlyLight.profile,
                  subtitle: 'Subtitle here',
                  onPressed: () async {
                    await _showdialogAddress();
                  },
                ),
                _listTile(
                  title: 'Orders',
                  icon: IconlyLight.bag,
                  onPressed: () {},
                ),
                _listTile(
                  title: 'Wishlist',
                  icon: IconlyLight.heart,
                  onPressed: () {},
                ),
                _listTile(
                  title: 'Viewed',
                  icon: IconlyLight.show,
                  onPressed: () {},
                ),
                _listTile(
                  title: 'Forget Password',
                  icon: IconlyLight.unlock,
                  onPressed: () {},
                ),
                SwitchListTile(
                  title: Text(
                      themeState.getDarkTheme ? "Dark Mode" : "Light Mode"),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  value: themeState.getDarkTheme,
                ),
                _listTile(
                  title: 'Logout',
                  icon: IconlyLight.logout,
                  onPressed: () async {
                    await _showLogOut();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogOut() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                "./assets/images/warning-sign.png",
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              const Text("Log Out"),
            ],
          ),
          content: const Text("Do you want logout?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showdialogAddress() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("UPDATE"),
          content: TextField(
            controller: _texteditingController,
            onChanged: (value) {
              _texteditingController.value;
            },
            decoration: const InputDecoration(hintText: "Your Address"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  Widget _listTile({
    required String title,
    required IconData icon,
    String? subtitle,
    required Function onPressed,
  }) {
    return ListTile(
      enabled: true,
      title: Text(title),
      subtitle: Text(subtitle ?? ""),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
