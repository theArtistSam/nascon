import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nascon_prep/configs/configs.dart';

class AppTextfield extends StatelessWidget {
  final String hintText;
  const AppTextfield({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 17,
            right: 16,
          ), // Adjust spacing here
          child: Icon(Iconsax.search_normal),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 27,
          vertical: 18,
        ),
        hintText: hintText,

        // Border when NOT focused
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),

        // Border when focused
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppTheme.borderColor, width: 1.5),
        ),

        // Background color
        filled: true,
        fillColor: AppTheme.background,
      ),
    );
  }
}
