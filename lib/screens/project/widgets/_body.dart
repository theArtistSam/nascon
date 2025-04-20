part of '../project.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    // Trigger FetchProjects event when the screen is loaded
    BlocProvider.of<JobBloc>(context).add(FetchProjects());
  }

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final modalProvider = Provider.of<ModalProvider>(context);

    return Scaffold(
      appBar: AppAppbar(
        title: 'Project',
        isBack: true,
        isTrailing: true,
        onTap: () {
          showMaterialModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder:
                (context) => SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: ChangeNotifierProvider.value(
                    value: modalProvider,
                    child: ModalSheet(title: 'Create Project'),
                  ),
                ),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            AppTextfield(
              hintText: 'Search',
              controller: TextEditingController(),
            ),

            SizedBox(
              height: 90,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 23),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: screenState.items.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 10);
                },
                itemBuilder: (BuildContext context, int index) {
                  return ScrollTile(
                    onTap: () => screenState.changeIndex(index),
                    isSelected: screenState.index == index,
                    title: screenState.items[index],
                  );
                },
              ),
            ),

            BlocBuilder<JobBloc, JobState>(
              builder: (context, state) {
                if (state.project is ProjectStateLoading) {
                  // Display loading indicator while fetching data
                  return Center(child: CircularProgressIndicator());
                } else if (state.project is ProjectStateSuccess) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.projects!.length,
                    itemBuilder: (context, index) {
                      final project = state.projects![index];
                      return ProjectTile(
                        project: project,
                      ); // Pass project data to your tile widget
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                  );
                } else if (state.project is ProjectStateFailure) {
                  // Display error message if there's an error fetching data
                  return Center(
                    child: Text(
                      'Failed to load projects: ${state.project!.message}',
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                  // Return empty container if state is unhandled
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
