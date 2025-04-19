part of '../dashboard.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);

    return Scaffold(
      appBar: AppAppbar(
        title: 'Dashboard',
        isBack: false,
        isTrailing: true,
        onTap: () {
          showMaterialModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder:
                (context) => SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: _Modal(screenState: screenState),
                ),
          );
        },
      ),
      body: Center(child: Text('Dashboard Screen')),
    );
  }
}
