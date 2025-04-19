import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nascon_prep/configs/configs.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBack;
  final String title;
  final VoidCallback? onTap;
  const AppAppbar({
    super.key,
    this.isBack = false,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppTheme.background, // Customize color
      automaticallyImplyLeading: false,
      leading:
          isBack
              ? IconButton(
                icon: Icon(Iconsax.back_square),
                onPressed: () => ''.pop(context),
              )
              : null,
      title: Text(title),
      actions: [
        Container(
          height: 40,
          color: AppTheme.purple,
          child: IconButton(
            icon: Icon(Iconsax.add, color: AppTheme.textWhite),
            onPressed: onTap,
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
