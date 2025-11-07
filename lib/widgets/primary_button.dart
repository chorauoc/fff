import 'package:flutter/material.dart';

import '../core/design_system.dart';

class PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 180,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final transform = isPressed
        ? Matrix4.identity().scale(0.97)
        : (isHovered ? Matrix4.identity().scale(1.03) : Matrix4.identity());

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isPressed = true),
        onTapUp: (_) {
          setState(() => isPressed = false);
          widget.onPressed();
        },
        onTapCancel: () => setState(() => isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          // transform: transform,
          width: widget.width,
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            gradient: AppGradients.red,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: isHovered ? 14 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(widget.label, style: AppTextStyles.loginButton),
        ),
      ),
    );
  }
}
