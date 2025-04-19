part of '../project.dart';

class _ProjectTile extends StatelessWidget {
  const _ProjectTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.textWhite,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Project Name",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Align(
                        widthFactor: .75,
                        child: CircleAvatar(
                          child: Image.network(
                            Static.personImg,
                            width: 50,
                            height: 50,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Text("Date Created", style: TextStyle(color: AppTheme.textGrey)),
            Row(
              children: [
                Text("50%"),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 3,
                      activeTrackColor: AppTheme.purple,
                      inactiveTrackColor: AppTheme.textGrey,
                      thumbColor: Colors.white,
                      overlayColor: AppTheme.purple,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 8,
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Slider(value: 0.5, onChanged: (value) {}),
                    ),
                  ),
                ),
                Text("24/48 Tasks"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
