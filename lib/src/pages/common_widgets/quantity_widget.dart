import 'package:flutter/material.dart';
import 'package:quitanda_app/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;
  final bool isRemovable;

  const QuantityWidget({
    super.key,
    required this.value,
    required this.suffixText,
    required this.result,
    this.isRemovable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            50.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 2,
            )
          ]),
      // Add/Remove item
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        _QuantityButton(
          icon: !isRemovable || value > 1 ? Icons.remove : Icons.delete_forever,
          color: !isRemovable || value > 1 ? Colors.grey : Colors.red,
          onTap: () {
            if (value == 1 && !isRemovable) return;

            int resultCount = value - 1;
            result(resultCount);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '$value$suffixText',
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _QuantityButton(
          icon: Icons.add,
          color: CustomColors.customSwatchColor,
          onTap: () {
            int resultCount = value + 1;
            result(resultCount);
          },
        ),
      ]),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onTap;
  const _QuantityButton({
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: onTap,
        child: Ink(
          height: 25.0,
          width: 25.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16.0,
          ),
        ),
      ),
    );
  }
}
