part of '../dashboard.dart';

class _Modal extends StatelessWidget {
  const _Modal({required this.screenState});

  final screenState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: AppTheme.textGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "Actions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    screenState.menuItems[index],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    switch (index) {
                      case 0:
                        '/task'.push(context);
                      case 1:
                        '/project'.push(context);
                        // case 2:
                        //   '/team'.push(context);
                        break;
                      default:
                    }
                  },
                );
              },
              itemCount: screenState.menuItems.length,
            ),
          ],
        ),
      ),
    );
  }
}
