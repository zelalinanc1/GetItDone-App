import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ColorThemeData with ChangeNotifier{

 final ThemeData _greenTheme=ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    appBarTheme: AppBarTheme(
      color: Colors.green,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
        subtitle1: TextStyle(
          color: Colors.white,
        ),
        headline3: TextStyle(
          color: Colors.white,
        )),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
        .copyWith(secondary: Colors.green),
  );
 final ThemeData _redTheme=ThemeData(
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    appBarTheme: AppBarTheme(
      color: Colors.red,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
        subtitle1: TextStyle(
          color: Colors.white,
        ),
        headline3: TextStyle(
          color: Colors.white,
        )),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
        .copyWith(secondary: Colors.red),
  );

 ThemeData _selectedThemeData=ThemeData(
   primaryColor: Colors.green,
   scaffoldBackgroundColor: Colors.green,
   appBarTheme: AppBarTheme(
     color: Colors.green,
   ),
   visualDensity: VisualDensity.adaptivePlatformDensity,
   textTheme: TextTheme(
       subtitle1: TextStyle(
         color: Colors.white,
       ),
       headline3: TextStyle(
         color: Colors.white,
       )),
   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
       .copyWith(secondary: Colors.green),
 );

 bool _isGreen=true;
 static SharedPreferences? _sharedPref;


 void switchTheme(bool selected){

   _isGreen=selected;
   saveThemeToSharedPref (selected);
   notifyListeners();
 }
bool get isGreen=>_isGreen;
 ThemeData get selectedThemeData=>_isGreen?_greenTheme:_redTheme;

 Future<void> createPrefObject()async{
   _sharedPref=await SharedPreferences.getInstance();
 }

void saveThemeToSharedPref (bool value){
   _sharedPref!.setBool('themeData', value);

}

void loadThemeFromSharedPref(){
   _isGreen=_sharedPref!.getBool('themeData')??true;
}





}