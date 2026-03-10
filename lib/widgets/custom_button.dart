import 'package:flutter/material.dart';
import '../constants/theme/foodie_colors.dart';

class CustomButton extends StatefulWidget {
  /// Label shown on the button
  final String text;

  /// Callback when tapped
  final VoidCallback? onPressed;

  /// Show a loading spinner instead of text
  final bool isLoading;

  /// Optional leading icon
  final IconData? icon;

  /// Full-width or wrap-content
  final bool fullWidth;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.fullWidth = true,
  });

  @override
  State<CustomButton> createState() => _FoodieButtonState();
}

class _FoodieButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scaleCtrl;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _scaleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.04,
    );
    _scaleAnim = Tween<double>(
      begin: 1.0,
      end: 0.96,
    ).animate(CurvedAnimation(parent: _scaleCtrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    super.dispose();
  }

  void _onTapDown(_) => _scaleCtrl.forward();
  void _onTapUp(_) => _scaleCtrl.reverse();
  void _onTapCancel() => _scaleCtrl.reverse();

  @override
  Widget build(BuildContext context) {
    final bool disabled = widget.onPressed == null || widget.isLoading;

    return GestureDetector(
      onTapDown: disabled ? null : _onTapDown,
      onTapUp: disabled ? null : _onTapUp,
      onTapCancel: disabled ? null : _onTapCancel,
      onTap: disabled ? null : widget.onPressed,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.fullWidth ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            gradient:
                disabled
                    ? null
                    : const LinearGradient(
                      colors: [Color(0xFFFF7A3C), Color(0xFFE8602C)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
            color: disabled ? const Color(0xFFDDC5B8) : null,
            borderRadius: BorderRadius.circular(14),
            boxShadow:
                disabled
                    ? []
                    : [
                      BoxShadow(
                        color: FoodieColors.primary.withOpacity(0.40),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
          ),
          child: Row(
            mainAxisSize:
                widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.isLoading) ...[
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FoodieColors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ] else if (widget.icon != null) ...[
                Icon(widget.icon, color: FoodieColors.white, size: 20),
                const SizedBox(width: 8),
              ],
              Text(
                widget.isLoading ? 'Please wait…' : widget.text,
                style: const TextStyle(
                  color: FoodieColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                  fontFamily: 'Georgia',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
