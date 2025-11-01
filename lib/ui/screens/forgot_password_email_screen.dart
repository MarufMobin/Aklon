import 'package:aklon/ui/screens/pin_varification_screen.dart';
import 'package:aklon/ui/screens/sign_up_screen.dart';
import 'package:aklon/ui/widgets/background_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  static const String name = '/forgot-password';

  @override
  State<ForgotPasswordEmailScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<ForgotPasswordEmailScreen> {
  // Text Editing Controller are write here
  final TextEditingController _emailTEController = TextEditingController();
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
                      'Your Email Address',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: 24),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'A 6 Digits OTP will be sent to your email Address',
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Email'),
                    // Using Package For Validation Email Field
                    validator: (String? value) {
                      String email = value ?? '';
                      if (EmailValidator.validate(email) == false) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),

                  ElevatedButton(
                    onPressed: _onTapSubmitButton,
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  SizedBox(height: 32),
                  // TextButton(
                  //   onPressed: _onTapForgotPasswordButton,
                  //   child: Text(
                  //     'Forget Password',
                  //     style: TextStyle(color: Colors.grey),
                  //   ),
                  // ),
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
    // if (_formKey.currentState!.validate()) {
    //   // TODO: Sign in with Api
    // }
    Navigator.pushNamed(context, PinVarificationScreen.name);
  }

  void _onTapSignIndButton() {Navigator.pop(context);}

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
