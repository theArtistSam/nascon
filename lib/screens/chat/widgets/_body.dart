part of '../chat.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    // FetchUsers().putUsers();
    // AppRoutes.search.push(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(
            icon: Icon(Icons.draw),
            onPressed: () {
              AppRoutes.search.push(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: AppTextfield(hintText: 'Search...'),
            ),
            ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _ChatTile();
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
