part of '../chatbox.dart';

class _Body extends StatelessWidget {
  const _Body();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(title: 'Chatbox', isBack: true, isTrailing: false),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppTheme.background,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Image.network(
                        Static.personImg,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Person name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Some text message"),
                      ],
                    ),
                    const Spacer(),
                    AppIconButton(
                      icon: Iconsax.call,
                      iconColor: AppTheme.purple,
                      color: AppTheme.background,
                    ),
                    const SizedBox(width: 10),
                    AppIconButton(
                      icon: Iconsax.video,
                      iconColor: AppTheme.purple,
                      color: AppTheme.background,
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: AppTheme.textGrey),
            ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  return _MessageTile(text: 'Some Text Message');
                }
                return _MessageTile(text: 'Some Text Message', isOther: true);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              itemCount: 5,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppTheme.background,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            spacing: 10,
            children: [
              Expanded(
                child: AppTextfield(
                  isPrefix: false,
                  hintText: 'Write a Message',
                ),
              ),
              AppIconButton(icon: Iconsax.send1),
            ],
          ),
        ),
      ),
    );
  }
}
