import 'package:aklon/ui/screens/change_password.dart';
import 'package:aklon/ui/screens/sign_in_screen.dart';
import 'package:aklon/ui/screens/sign_up_screen.dart';
import 'package:aklon/ui/widgets/background_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVarificationScreen extends StatefulWidget {
  const PinVarificationScreen({super.key});

  static const String name = '/pin-varification';

  @override
  State<PinVarificationScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<PinVarificationScreen> {
  // Text Editing Controller are write here
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Pin Varification',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: 24),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'A 6 Digits OTP has been sent to your email Address',
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 24),
                  PinCodeTextField(
                    keyboardType: TextInputType.number,
                    backgroundColor: Colors.transparent,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      inactiveFillColor: Colors.white,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    // backgroundColor: Colors.blue.shade50,
                    enableActiveFill: true,
                    // errorAnimationController: errorController,
                    controller: _otpTEController,
                    onCompleted: (v) {
                      print("Completed");
                    },

                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    }, appContext: context,
                  ),
                  SizedBox(height: 8),

                  ElevatedButton(
                    onPressed: _onTapSubmitButton,
                    child: Text('Varify'),
                  ),
                  SizedBox(height: 32),
                  
                  RichText(
                    text: TextSpan(
                      text: "Have an account ? ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.green,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _onTapSignIndButton,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() {
    Navigator.pushNamed(context, ChangePassword.name);
  }

  void _onTapSignIndButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
