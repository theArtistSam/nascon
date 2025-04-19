part of '../project.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final modalProvider = Provider.of<ModalProvider>(context);

    return Scaffold(
      appBar: AppAppbar(
        title: 'Project',
        isBack: true,
        isTrailing: true,
        onTap: () {
          showMaterialModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder:
                (context) => SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: ChangeNotifierProvider.value(
                    value: modalProvider,
                    child: ModalSheet(title: 'Create Project'),
                  ),
                ),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            AppTextfield(
              hintText: 'Search',
              controller: TextEditingController(),
            ),

            SizedBox(
              height: 90,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 23),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: screenState.items.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 10);
                },
                itemBuilder: (BuildContext context, int index) {
                  return ScrollTile(
                    onTap: () => screenState.changeIndex(index),
                    isSelected: screenState.index == index,
                    title: screenState.items[index],
                  );
                },
              ),
            ),

            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _ProjectTile();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              itemCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}
