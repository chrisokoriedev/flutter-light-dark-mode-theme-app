import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ligthdarkfunction/hey.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) =>ThemeProvider(),
    builder: (context, _) {
      final provider=Provider.of<ThemeProvider>(context);
      return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: provider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: HomePage(),
          );
        },
      );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Picker'),
        actions: [ChangeThemeButtonWidget()],
      ),
      body: Center(
        child: Text(
          'Current Theme is :$currentTheme',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final provider=Provider.of<ThemeProvider>(context,listen: false);
          provider.toggleTheme(value);
        });
  }
}
