import 'package:aklon/ui/screens/sign_in_screen.dart';
import 'package:aklon/ui/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // Go to next Screen function are here
  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));

    // This Navigator name Imperative Navigator or Navigator 1
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  @override
  void initState(){
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AssetsPath.backgroundSvg,
            fit: BoxFit.cover,
            height: double.maxFinite,
            width: double.maxFinite,
          ),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(AssetsPath.logoSvg, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
