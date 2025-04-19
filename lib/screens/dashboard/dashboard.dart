import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nascon_prep/configs/configs.dart';
import 'package:nascon_prep/widgets/core/app_appbar.dart';
import 'package:provider/provider.dart';
part 'widgets/_body.dart';
part '_state.dart';
part './widgets/_modal.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
