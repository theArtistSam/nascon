part of '../task.dart';

class _Card extends StatelessWidget {
  const _Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // spacing: 10,
        children: [
          Text('UserFlow', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Deadline', style: TextStyle(color: Colors.blue)),
          Text('Priority', style: TextStyle(color: Colors.yellow)),
          Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
