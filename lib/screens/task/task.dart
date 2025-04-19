import 'package:flutter/material.dart';
import 'package:nascon_prep/screens/task/widgets/_scroll_tile.dart';
import 'package:nascon_prep/widgets/core/app_appbar.dart';
import 'package:nascon_prep/widgets/core/app_textfield.dart';
import 'package:provider/provider.dart';
part 'widgets/_body.dart';
part '_state.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
