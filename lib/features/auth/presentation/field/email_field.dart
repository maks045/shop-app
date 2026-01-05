import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/extensions/router_extension.dart';
import '../../../../core/buttons/app_button.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/auth_services.dart';
import '../screen/terms_screen.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  String errorMessage = '';
  bool _obscurePassword = true;

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void register() async {
    setState(() {
      errorMessage = '';
    });
    try {
      await authService.value.createAccount(
        email: controllerEmail.text.trim(),
        password: controllerPassword.text,
      );
      popPage();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'An error occurred';
      });
    }
  }

  void popPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: TextFormField(
              controller: controllerEmail,
              focusNode: _emailFocus,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                hintText: 'Email',
                border: InputBorder.none,
              ),
              validator: (value) {
                final email = value?.trim() ?? '';
                if (email.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(
                  r"^[^@\s]+@[^@\s]+\.[^@\s]+$",
                ).hasMatch(email)) {
                  return 'Enter a valid email';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordFocus);
              },
            ),
          ),

          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: TextFormField(
              controller: controllerPassword,
              focusNode: _passwordFocus,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                hintText: 'Password',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
              validator: (value) {
                final pass = value ?? '';
                if (pass.isEmpty) {
                  return 'Please enter your password';
                } else if (pass.length < 4) {
                  return 'Password must be at least 4 characters';
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
          ),
          const SizedBox(height: 20),
          if (errorMessage.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(errorMessage, style: TextStyle(color: Colors.red)),
          ],
          const SizedBox(height: 20),
          AppButton(
            text: 'Sign Up',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.push(
                  TermsScreen(
                    onAgree: () {
                      register();
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
