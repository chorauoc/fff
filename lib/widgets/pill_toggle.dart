import 'package:flutter/material.dart';

import '../core/design_system.dart';

class PillToggle extends StatefulWidget {
  final String left;
  final String right;
  final bool isLeftSelected;
  final ValueChanged<bool> onChanged;

  const PillToggle({
    super.key,
    required this.left,
    required this.right,
    required this.isLeftSelected,
    required this.onChanged,
  });

  @override
  State<PillToggle> createState() => _PillToggleState();
}

class _PillToggleState extends State<PillToggle> {
  bool hoverLeft = false;
  bool hoverRight = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSegment(widget.left, widget.isLeftSelected, true),
        const SizedBox(width: 12),
        _buildSegment(widget.right, !widget.isLeftSelected, false),
      ],
    );
  }

  Widget _buildSegment(String label, bool selected, bool isLeft) {
    final isHover = isLeft ? hoverLeft : hoverRight;

    return MouseRegion(
      onEnter: (_) => setState(() {
        if (isLeft)
          hoverLeft = true;
        else
          hoverRight = true;
      }),
      onExit: (_) => setState(() {
        if (isLeft)
          hoverLeft = false;
        else
          hoverRight = false;
      }),
      child: GestureDetector(
        onTap: () => widget.onChanged(isLeft),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 120,
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: selected ? AppGradients.red : null,
            color: selected ? null : Colors.white,
            border: selected
                ? null
                : Border.all(color: AppColors.border, width: 1.2),
            borderRadius: BorderRadius.circular(30),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: isHover ? 10 : 6,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : [],
          ),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: selected ? Colors.white : AppColors.accent,
            ),
          ),
        ),
      ),
    );
  }
}
