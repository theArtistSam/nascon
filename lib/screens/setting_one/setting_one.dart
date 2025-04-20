import 'package:flutter/material.dart';
import 'package:nascon_prep/configs/configs.dart';
import 'package:nascon_prep/router/routes.dart';
import 'package:nascon_prep/widgets/core/app_appbar.dart';
import 'package:provider/provider.dart';
part 'widgets/_body.dart';
part '_state.dart';

class SettingOneScreen extends StatelessWidget {
  const SettingOneScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
