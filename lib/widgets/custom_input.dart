import 'package:flutter/material.dart';

import '../core/design_system.dart';

class CustomInput extends StatefulWidget {
  final String label;
  final String? hint;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomInput({
    super.key,
    required this.label,
    this.hint,
    this.obscure = false,
    this.controller,
    this.keyboardType,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscureVisible = true; // true = password hidden

  @override
  void initState() {
    super.initState();
    _obscureVisible = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscure ? _obscureVisible : false,
      keyboardType: widget.keyboardType,
      style: AppTextStyles.body,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: AppTextStyles.smallMuted,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.hint,
        hintStyle: const TextStyle(color: AppColors.muted),
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 18,
        ),
        filled: true,
        fillColor: AppColors.cardBg,

        // Outline border matching your design
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: AppColors.border, width: 1),
          gapPadding: 8,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: AppColors.border, width: 1),
          gapPadding: 8,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: AppColors.accent, width: 1),
          gapPadding: 8,
        ),

        // ---- Show/Hide Password Button ----
        suffixIcon: widget.obscure
            ? GestureDetector(
                onTapDown: (_) =>
                    setState(() => _obscureVisible = !_obscureVisible),
                child: Icon(
                  _obscureVisible ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black, // black icon color (not red)
                ),
              )
            : null,
      ),
    );
  }
}
