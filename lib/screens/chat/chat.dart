import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nascon_prep/configs/configs.dart';
import 'package:nascon_prep/router/routes.dart';
import 'package:nascon_prep/screens/chat/services/fetch_users.dart';
import 'package:nascon_prep/screens/chatbox/chatbox.dart';
import 'package:nascon_prep/static/static.dart';
import 'package:nascon_prep/widgets/core/app_appbar.dart';
import 'package:nascon_prep/widgets/core/app_textfield.dart';
import 'package:provider/provider.dart';
part 'widgets/_body.dart';
part '_state.dart';
part './widgets/_chat_tile.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
