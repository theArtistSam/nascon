part of '../chatbox.dart';

class _MessageTile extends StatelessWidget {
  final String text;
  final bool isOther;
  const _MessageTile({required this.text, this.isOther = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        !isOther ? Spacer() : SizedBox.shrink(),
        Container(
          decoration: BoxDecoration(
            color: !isOther ? AppTheme.purple : AppTheme.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(
                color: isOther ? AppTheme.textBlack : AppTheme.textWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
