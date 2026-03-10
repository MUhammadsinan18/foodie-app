import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodieapp/auth/pages/signup_page.dart';
import 'package:foodieapp/pages/view/home_page.dart';
import '../../constants/theme/foodie_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _loading = false;

  void _handleLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
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
              // ── Logo row
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
                'Welcome back 👋',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: FoodieColors.text,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Sign in to order your favourites',
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

              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: FoodieColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // ── Login button
              CustomButton(
                text: 'Sign In',
                icon: Icons.login_rounded,
                isLoading: _loading,
                onPressed: _handleLogin,
              ),

              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {

                  },
                  child: const Text(
                    'OR Continue with',
                    style: TextStyle(
                      color: FoodieColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ── Google outline button
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        'assets/images/facebook_logo.png',
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        'assets/images/google_logo.png',
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: FoodieColors.hint, fontSize: 13),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          color: FoodieColors.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupPage(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
