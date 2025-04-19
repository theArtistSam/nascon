import 'package:flutter/material.dart';
import 'package:nascon_prep/static/static.dart';
import 'package:nascon_prep/widgets/core/app_appbar.dart';
import 'package:provider/provider.dart';
part 'widgets/_body.dart';
part '_state.dart';

class ChatboxScreen extends StatelessWidget {
  const ChatboxScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
