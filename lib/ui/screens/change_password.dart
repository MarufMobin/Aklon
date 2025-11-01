import 'package:aklon/ui/screens/forgot_password_email_screen.dart';
import 'package:aklon/ui/screens/sign_up_screen.dart';
import 'package:aklon/ui/widgets/background_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});
  static const String name = '/change-password';
  @override
  State<ChangePassword> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<ChangePassword> {

  // Text Editing Controller are write here
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmTEController = TextEditingController();
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
                      'Set Your Password',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password Should be more then 6 letter',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    validator: (String? value) {
                      if ( (value?.length ?? 0) <= 6 ) {
                        return 'Please Enter a valid password';
                      }
                      return null;
                    },
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator: (String? value) {
                      if ( (value ?? '') != _passwordTEController.text ) {
                        return 'Confirm Password Does Not Match';
                      }
                      return null;
                    },
                    controller: _confirmTEController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Confirm Password'),
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
                            ..onTap = _onTapSignUpButton,
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
    Navigator.pushNamed(context, ForgotPasswordEmailScreen.name);
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context,SignUpScreen.name);
  }

  @override
  void dispose() {
    _passwordTEController.dispose();
    _confirmTEController.dispose();
    super.dispose();
  }
}
