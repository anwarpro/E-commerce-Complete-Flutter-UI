import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  bool showOnBoardScreen = _prefs.getBool("onBoarding") ?? true;

  if (showOnBoardScreen) {
    _prefs.setBool("onBoarding", false);
  }

  runApp(MyApp(
    showOnBoardScreen: showOnBoardScreen,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool showOnBoardScreen;

  MyApp({required this.showOnBoardScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute:
          showOnBoardScreen ? SplashScreen.routeName : HomeScreen.routeName,
      routes: routes,
    );
  }
}
