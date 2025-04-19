import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nascon_prep/configs/configs.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double radius;
  final IconData icon;
  final Color color;
  const AppIconButton({
    super.key,
    this.onTap,
    this.radius = 40,
    this.icon = Iconsax.add,
    this.color = AppTheme.purple,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: radius, // width & height
        height: radius,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(icon, color: AppTheme.background),
      ),
    );
  }
}
