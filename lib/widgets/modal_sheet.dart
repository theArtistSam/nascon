import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nascon_prep/blocs/job/bloc.dart';
import 'package:nascon_prep/configs/configs.dart';
import 'package:nascon_prep/providers/modal_provider.dart';
import 'package:nascon_prep/static/static.dart';
import 'package:nascon_prep/utils/datetime.dart';
import 'package:nascon_prep/widgets/core/app_button.dart';
import 'package:nascon_prep/widgets/core/app_icon_button.dart';
import 'package:nascon_prep/widgets/core/app_textfield.dart';

class ModalSheet extends StatefulWidget {
  const ModalSheet({super.key, this.projects, required this.title});
  final List<String>? projects;
  final String title;

  @override
  State<ModalSheet> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  @override
  Widget build(BuildContext context) {
    final modalProvider = ModalProvider.s(context, true);
    modalProvider.items = widget.projects;

    return Container(
      height: MediaQuery.sizeOf(context).height - 100,
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                widget.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            widget.projects != null
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      "Select Project",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton(
                      value: modalProvider.selectedValue,
                      icon: const Icon(Iconsax.arrow_down),
                      items:
                          modalProvider.items!.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        print(modalProvider.selectedValue);
                        modalProvider.selectDropdown(newValue!);
                      },
                    ),
                  ],
                )
                : const SizedBox.shrink(),
            const SizedBox(height: 20),
            Text(
              "Add Member",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              spacing: 15,
              children: [
                CircleAvatar(
                  child: Image.network(Static.personImg, width: 50, height: 50),
                ),
                AppIconButton(
                  onTap: () {
                    debugPrint("Add new User");
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date and Time",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    '/calender'.push(context);
                  },
                  icon: Icon(Iconsax.calendar),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              spacing: 40,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Icon(Iconsax.calendar),
                    Text(
                      modalProvider.rangeStart != null
                          ? Datetime.format(modalProvider.rangeStart!)
                          : 'Start Date',
                    ),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    Icon(Iconsax.calendar),
                    Text(
                      modalProvider.rangeEnd != null
                          ? Datetime.format(modalProvider.rangeEnd!)
                          : 'End Date',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            Text(
              "Add Label",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(vertical: 10),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      modalProvider.selectLabel(index);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _labelColor(index),
                        borderRadius: BorderRadius.circular(10),
                        border:
                            modalProvider.selectedIndex == index
                                ? Border.all(width: 2, color: Colors.red)
                                : null,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
                itemCount: 5,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            AppTextfield(
              hintText: 'Name...',
              isPrefix: false,
              controller: modalProvider.nameController,
            ),
            Text(
              "Add Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            AppTextfield(
              hintText: 'Add a description',
              isPrefix: false,
              controller: modalProvider.descriptionController,
            ),
            const Spacer(),
            AppButton(
              text: 'Create',
              onTap: () {
                final List<String>? projects = widget.projects;

                final name = modalProvider.nameController.text.trim();
                final description =
                    modalProvider.descriptionController.text.trim();
                final startDate = modalProvider.rangeStart;
                final endDate = modalProvider.rangeEnd;

                if (name.isEmpty ||
                    description.isEmpty ||
                    startDate == null ||
                    endDate == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill all required fields.')),
                  );
                  return;
                }
                if (projects == null) {
                  BlocProvider.of<JobBloc>(context).add(
                    CreateProject(
                      name: name,
                      members: [], // Replace with actual member list
                      label: modalProvider.selectedIndex,
                      startDate: startDate,
                      endDate: endDate,
                      description: description,
                    ),
                  );
                } else {
                  BlocProvider.of<JobBloc>(context).add(
                    CreateTask(
                      name: name,
                      projectId: 'project1', // Replace with actual project ID
                      members: [], // Replace with actual member list
                      label: modalProvider.selectedIndex,
                      startDate: startDate,
                      endDate: endDate,
                      description: description,
                    ),
                  );
                }

                ''.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Color _labelColor(int index) {
    switch (index) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.blueGrey;
      case 4:
        return Colors.purpleAccent;
      default:
        return Colors.blue;
    }
  }
}
