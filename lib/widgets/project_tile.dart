// import 'package:flutter/material.dart';
// import 'package:nascon_prep/configs/configs.dart';
// import 'package:nascon_prep/static/static.dart';

// class ProjectTile extends StatelessWidget {
//   const ProjectTile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppTheme.textWhite,
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Project Name",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 50,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: 5,
//                     scrollDirection: Axis.horizontal,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       return Align(
//                         widthFactor: .75,
//                         child: CircleAvatar(
//                           child: Image.network(
//                             Static.personImg,
//                             width: 50,
//                             height: 50,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Start Date", style: TextStyle(color: AppTheme.textGrey)),
//                 Text("End Date", style: TextStyle(color: AppTheme.textGrey)),
//               ],
//             ),
//             Row(
//               children: [
//                 Text("50%"),
//                 Expanded(
//                   child: SliderTheme(
//                     data: SliderTheme.of(context).copyWith(
//                       trackHeight: 3,
//                       activeTrackColor: AppTheme.purple,
//                       inactiveTrackColor: AppTheme.textGrey,
//                       thumbColor: Colors.white,
//                       overlayColor: AppTheme.purple,
//                       thumbShape: const RoundSliderThumbShape(
//                         enabledThumbRadius: 8,
//                       ),
//                     ),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: Slider(value: 0.5, onChanged: (value) {}),
//                     ),
//                   ),
//                 ),
//                 Text("24/48 Tasks"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:nascon_prep/configs/configs.dart';
import 'package:nascon_prep/models/project/project.dart';
import 'package:nascon_prep/static/static.dart';
import 'package:nascon_prep/utils/datetime.dart';

class ProjectTile extends StatelessWidget {
  final Project project;

  const ProjectTile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.textWhite,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project title & member avatars
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  project.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: project.members.length,
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Align(
                        widthFactor: .75,
                        child: CircleAvatar(
                          child: Image.network(
                            Static
                                .personImg, // You can use actual user images if you have URLs
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

            // Start and End Dates
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Datetime.format(project.startDate),
                  style: TextStyle(color: AppTheme.textGrey),
                ),
                Text(
                  Datetime.format(project.endDate),
                  style: TextStyle(color: AppTheme.textGrey),
                ),
              ],
            ),

            // Progress bar with dummy values (you can calculate real ones)
            Row(
              children: [
                Text("50%"), // You could pass a progress % or task count
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
                    child: Slider(
                      value: 0.5,
                      onChanged: null, // Disabled, visual only
                    ),
                  ),
                ),
                Text(
                  "24/48 Tasks",
                ), // You can pass actual task stats if you have them
              ],
            ),
          ],
        ),
      ),
    );
  }
}
