import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModalProvider extends ChangeNotifier {
  static ModalProvider s(BuildContext context, [listen = false]) =>
      Provider.of<ModalProvider>(context, listen: listen);

  List<String>? items;
  int selectedIndex = 0;
  String? selectedValue;

  void selectDropdown(String value) {
    selectedValue = value;
    notifyListeners();
  }

  void selectLabel(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
