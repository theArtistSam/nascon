part of '../chat.dart';

class _ChatTile extends StatelessWidget {
  const _ChatTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              child: Image.network(Static.personImg, width: 50, height: 50),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Person name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text("Some text message"),
              ],
            ),
            const Spacer(),
            ClipOval(
              child: Container(
                width: 20,
                height: 20,
                color: AppTheme.purple,
                alignment: Alignment.center,
                child: Text("3", style: TextStyle(color: AppTheme.textWhite)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
