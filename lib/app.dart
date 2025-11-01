import 'package:aklon/ui/screens/change_password.dart';
import 'package:aklon/ui/screens/forgot_password_email_screen.dart';
import 'package:aklon/ui/screens/pin_varification_screen.dart';
import 'package:aklon/ui/screens/sign_in_screen.dart';
import 'package:aklon/ui/screens/sign_up_screen.dart';
import 'package:aklon/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Entire the application global code Start here
        colorSchemeSeed: Colors.green,
        // Entire the application global code end here

        // Theme Data Text Design are start here
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
        // Theme Data Text Design are end here

        // Input Related Work are start here
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        // Input Related Work are end here

        // Elevated Button There related Work are start here
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
        ),
        // Elevated Button There related Work are end here

        // Text Button related work are star here
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.green),
        ),
        // Text Button related work are end here
      ),
      debugShowCheckedModeBanner: false,

      // home: SplashScreen(),
      initialRoute: '/',

      // Declaretive Route
      // routes: {
      //   '/' : (context) => SplashScreen(),
      //   '/sign-in' : (context) => SignInScreen(),
      // }
      routes: {
        SplashScreen.name: (context) => SplashScreen(),
        SignInScreen.name: (context) => SignInScreen(),
        SignUpScreen.name: (context) => SignUpScreen(),
        ForgotPasswordEmailScreen.name: (context) =>
            ForgotPasswordEmailScreen(),
        PinVarificationScreen.name: (context) => PinVarificationScreen(),
        ChangePassword.name: (context) => ChangePassword(),
      },
    );
  }
}
