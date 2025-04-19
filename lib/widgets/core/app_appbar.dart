import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nascon_prep/configs/configs.dart';
import 'package:nascon_prep/widgets/core/app_icon_button.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBack;
  final bool isTrailing;
  final String title;
  final VoidCallback? onTap;
  const AppAppbar({
    super.key,
    this.isBack = false,
    this.isTrailing = false,
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
                icon: Icon(Iconsax.arrow_left),
                onPressed: () => ''.pop(context),
              )
              : null,
      title: Text(title),
      actions:
          isTrailing
              ? [AppIconButton(onTap: onTap), const SizedBox(width: 15)]
              : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
