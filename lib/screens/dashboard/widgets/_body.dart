part of '../dashboard.dart';

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

    return Scaffold(
      appBar: AppAppbar(
        title: 'Dashboard',
        isBack: false,
        isTrailing: true,
        onTap: () {
          showMaterialModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder:
                (context) => SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: _Modal(screenState: screenState),
                ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<JobBloc, JobState>(
          builder: (context, state) {
            if (state.project is ProjectStateLoading) {
              // Display loading indicator while fetching data
              return Center(child: CircularProgressIndicator());
            } else if (state.project is ProjectStateSuccess) {
              return ListView.separated(
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
      ),
    );
  }
}
