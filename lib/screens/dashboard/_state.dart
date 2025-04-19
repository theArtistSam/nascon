part of 'dashboard.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final List<String> menuItems = [
    'Create Task',
    'Create Project',
    'Create Team',
    'Create Meeting',
  ];
}
