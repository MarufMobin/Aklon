import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget{
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SignInScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text('This Is Sign in Screen'),
      ),
    );
  }
}