part of '../chatbox.dart';

class _Body extends StatelessWidget {
  const _Body();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(title: 'Chatbox', isBack: true, isTrailing: true),
      body: Column(
        children: [
          Row(
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
            ],
          ),
        ],
      ),
    );
  }
}
