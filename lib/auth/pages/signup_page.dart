import 'package:flutter/material.dart';
import '../../constants/theme/foodie_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_field.dart';




class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailCtrl    = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _loading = false;

  void _handleLogin() async {
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodieColors.accent,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,

                    decoration: BoxDecoration(
                      color: FoodieColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage(
                        "assets/images/tittle_image.jpg",
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'FOODIE EMPIRE',
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: FoodieColors.text,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 48),

              // ── Heading
              const Text(
                'Sign up!',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: FoodieColors.text,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Enter your credentials for Account',
                style: TextStyle(fontSize: 14, color: FoodieColors.hint),
              ),

              const SizedBox(height: 36),

              // ── Email field
              FoodieTextField(
                text: 'Email address',
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.mail_outline_rounded,
              ),

              const SizedBox(height: 16),

              // ── Password field
              FoodieTextField(
                text: 'Password',
                controller: _passwordCtrl,
                obscureText: true,
                prefixIcon: Icons.lock_outline_rounded,
              ),

              const SizedBox(height: 10),


              const SizedBox(height: 32),

              // ── Login button
              CustomButton(
                text: 'Sign up',
                icon: Icons.login_rounded,
                isLoading: _loading,
                onPressed: _handleLogin,
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}