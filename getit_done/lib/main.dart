import 'package:flutter/material.dart';
import 'package:getit_done/models/color_theme_data.dart';
import 'package:getit_done/screens/home_page.dart';
import 'package:getit_done/screens/splash_page.dart';
import 'package:provider/provider.dart';

import 'models/items_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  await ItemData().createPrefObject();


  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemData>(
        create: (BuildContext context) => ItemData()),

    ChangeNotifierProvider<ColorThemeData>(
        create: (context) => ColorThemeData()),
  ],
   child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    

    return Consumer2<ItemData,ColorThemeData>(
        builder: (context,itemData,colorThemeData,child) {
        itemData.loadItemsFromSharedPref();
        colorThemeData.loadThemeFromSharedPref();

          return MaterialApp(
            theme: Provider
                .of<ColorThemeData>(context)
                .selectedThemeData,
              routes: {
              '/': (context)=> SplashPage(),
              '/home': (context)=> HomePage(),
              },

            //home: const HomePage(),
          );

        }
    );
  }
}








