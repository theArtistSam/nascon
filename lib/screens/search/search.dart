import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nascon_prep/models/user/user.dart';
import 'package:nascon_prep/screens/chat/services/fetch_users.dart';
import 'package:nascon_prep/widgets/core/app_appbar.dart';
import 'package:nascon_prep/widgets/core/app_textfield.dart';
import 'package:provider/provider.dart';
part 'widgets/_body.dart';
part '_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
