import 'package:aklon/ui/widgets/background_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = '/sign-up';
  @override
  State<SignUpScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SignUpScreen> {
  // Text Editing Controller are write here
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
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
                      'Join With Us',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),

                  SizedBox(height: 8),
                  TextFormField(
                    validator: (String? value) {
                      if( value?.trim().isEmpty ?? true ){
                        return 'Please Enter your First Name';
                      }
                      return null;
                    },
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'First Name'),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    validator: (String? value) {
                      if( value?.trim().isEmpty ?? true ){
                        return 'Please Enter your Last Name';
                      }
                      return null;
                    },
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Last Name'),
                  ),
                  SizedBox(height: 8),
                  TextFormField(

                    validator: (String? value) {
                      if( value?.trim().isEmpty ?? true ){
                        return 'Please Enter your valid mobile number';
                      }
                      return null;
                    },
                    controller: _passwordTEController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: 'Phone'),
                  ),
                  SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: _onTapSignIndButton,
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  SizedBox(height: 32),
                  TextButton(
                    onPressed: _onTapForgotPasswordButton,
                    child: Text(
                      'Forget Password',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account ? ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign UP",
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

  void _onTapSignIndButton() {
    if (_formKey.currentState!.validate()) {
      // TODO: Sign in with Api
    }
  }

  void _onTapForgotPasswordButton() {
    // TODO: Forgot Password with APi
  }

  void _onTapSignUpButton() {
    // TODO: Sing Up With Api
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
