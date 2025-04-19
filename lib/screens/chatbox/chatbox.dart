import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nascon_prep/configs/configs.dart';
import 'package:nascon_prep/screens/chat/chat.dart';
import 'package:nascon_prep/screens/chatbox/widgets/_body.dart';
import 'package:nascon_prep/static/static.dart';
import 'package:nascon_prep/widgets/core/app_appbar.dart';
import 'package:nascon_prep/widgets/core/app_icon_button.dart';
import 'package:nascon_prep/widgets/core/app_textfield.dart';
import 'package:provider/provider.dart';
// part 'widgets/_body.dart';
part '_state.dart';
part './widgets/_message_tile.dart';

String to = '2uo79zX41UF9wM3KN9FK';
String from = '';

class ChatboxScreen extends StatelessWidget {
  const ChatboxScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: ChatScreen2(currentUserId: to, otherUserId: from),
    );
  }
}
