part of 'project.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  int index = 0;
  List<String> items = ['Projects', 'Completed', 'Flag'];
  void changeIndex(int selectedIndex) {
    index = selectedIndex;
    notifyListeners();
  }
}
