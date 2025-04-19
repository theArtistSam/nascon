import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:nascon_prep/configs/configs.dart';
import 'package:nascon_prep/providers/modal_provider.dart';
import 'package:nascon_prep/utils/datetime.dart';
import 'package:nascon_prep/widgets/core/app_button.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
part 'widgets/_body.dart';
part '_state.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: TableRangeExample(),
    );
  }
}
