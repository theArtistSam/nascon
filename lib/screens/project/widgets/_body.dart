part of '../project.dart';

class _Body extends StatelessWidget {
  const _Body();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(title: 'Project', isBack: true, isTrailing: true),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            AppTextfield(hintText: 'Search'),

            ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20),
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
