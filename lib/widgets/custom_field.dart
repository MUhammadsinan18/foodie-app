import 'package:flutter/material.dart';

import '../constants/theme/foodie_colors.dart';
//  FoodieTextField
//  Required constructor param: text (label/hint)
// ─────────────────────────────────────────────
class FoodieTextField extends StatefulWidget {
  /// Label and hint shown inside the field
  final String text;

  /// Optional controller; one is created internally if omitted
  final TextEditingController? controller;

  /// Set true for password fields
  final bool obscureText;

  /// Keyboard type (email, number, etc.)
  final TextInputType keyboardType;

  /// Leading icon inside the field
  final IconData? prefixIcon;

  const FoodieTextField({
    super.key,
    required this.text,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  });

  @override
  State<FoodieTextField> createState() => _FoodieTextFieldState();
}

class _FoodieTextFieldState extends State<FoodieTextField> {
  late final TextEditingController _ctrl;
  bool _showPassword = false;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _ctrl = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Only dispose internally created controller
    if (widget.controller == null) _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isPassword = widget.obscureText;

    return Focus(
      onFocusChange: (focused) => setState(() => _hasFocus = focused),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: FoodieColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _hasFocus ? FoodieColors.primary : FoodieColors.border,
            width: _hasFocus ? 2 : 1.5,
          ),
          boxShadow: _hasFocus
              ? [
            BoxShadow(
              color: FoodieColors.primary.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ]
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: _ctrl,
          obscureText: isPassword && !_showPassword,
          keyboardType: widget.keyboardType,
          style: const TextStyle(
            color: FoodieColors.text,
            fontSize: 15,
            fontFamily: 'Georgia',
          ),
          decoration: InputDecoration(
            labelText: widget.text,
            hintText: widget.text,
            labelStyle: TextStyle(
              color: _hasFocus ? FoodieColors.primary : FoodieColors.hint,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            hintStyle: const TextStyle(
              color: FoodieColors.hint,
              fontSize: 14,
            ),
            prefixIcon: widget.prefixIcon != null
                ? Icon(
              widget.prefixIcon,
              color: _hasFocus ? FoodieColors.primary : FoodieColors.hint,
              size: 20,
            )
                : null,
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(
                _showPassword
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                color: FoodieColors.hint,
                size: 20,
              ),
              onPressed: () =>
                  setState(() => _showPassword = !_showPassword),
            )
                : null,
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
