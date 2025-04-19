import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nascon_prep/providers/modal_provider.dart';
import 'package:nascon_prep/widgets/modal_sheet.dart';
import 'package:nascon_prep/widgets/scroll_tile.dart';
import 'package:nascon_prep/widgets/core/app_appbar.dart';
import 'package:nascon_prep/widgets/core/app_textfield.dart';
import 'package:provider/provider.dart';
part 'widgets/_body.dart';
part '_state.dart';
part './widgets/_card.dart';

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
