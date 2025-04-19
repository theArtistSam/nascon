part of '../task.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 4);
  }

  List<String> scrollTileItems = ['Projects', 'Complet', 'Flag'];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final modalProvider = Provider.of<ModalProvider>(context);
    return Scaffold(
      appBar: AppAppbar(
        title: 'Task',
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
                    child: ModalSheet(
                      title: 'Create Task',
                      // TODO: Provide a list of projects here
                      projects: ['p1', 'p2'],
                    ),
                  ),
                ),
          );
        },
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextfield(hintText: 'Search'),
            SizedBox(
              height: 90,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 20),
                scrollDirection: Axis.horizontal,
                itemCount: scrollTileItems.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 20);
                },
                itemBuilder: (BuildContext context, int index) {
                  return ScrollTile(
                    onTap: () {
                      setState(() {
                        selected = index;
                      });
                    },
                    isSelected: selected == index,
                    title: scrollTileItems[index],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 20),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: .94,
              ),
              itemCount: 4, // Number of items
              itemBuilder: (context, index) {
                return _Card(); // Replace with the above widget
              },
            ),
            Expanded(child: Center(child: Text('Task Screen Body'))),
          ],
        ),
      ),
    );
  }
}
