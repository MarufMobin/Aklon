import 'package:aklon/ui/widgets/background_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SignInScreen> {
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
                      'Gets Started With',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Email'),

                    // Normal Validation are here
                    // validator: (String? value) {
                    //   if (value?.isEmpty ?? true) {
                    //     return 'Enter a valid Email';
                    //   }
                    //   return null;
                    // },

                    // Using Package For Validation Email Field
                    validator: (String?value){
                      String email = value ?? '';
                      if( EmailValidator.validate(email) == false ){
                        return 'Enter a valid email';
                      }
                      return null;
                    }
                  ),
                  SizedBox(height: 8),
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
