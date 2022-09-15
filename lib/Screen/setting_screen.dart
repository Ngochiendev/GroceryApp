import 'package:flutter/material.dart';
import 'package:groceryapp/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Center(
          child: SwitchListTile(
        title: const Text("Theme"),
        secondary: Icon(themeState.getDarkTheme
            ? Icons.dark_mode_outlined
            : Icons.light_mode_outlined),
        onChanged: (bool value) {
          setState(() {
            themeState.setDarkTheme = value;
          });
        },
        value: themeState.getDarkTheme,
      )),
    );
  }
}
