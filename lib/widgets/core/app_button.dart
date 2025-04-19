import 'package:flutter/material.dart';
import 'package:nascon_prep/configs/configs.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.onTap, this.width, required this.text});

  final VoidCallback? onTap;
  final double? width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.purple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            text,
            style: TextStyle(fontSize: 16, color: AppTheme.textWhite),
          ),
        ),
      ),
    );
  }
}
