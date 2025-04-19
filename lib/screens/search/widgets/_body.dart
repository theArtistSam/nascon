part of '../search.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  int selected = 0;
  List<User> users = [];
  void wait() async {
    try {
      users = await FetchUsers().getUsers();
    } catch (e) {
      log('Error fetching users: $e');
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    wait();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(title: 'Add member', isBack: true),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextfield(hintText: 'Search'),
            SizedBox(height: 20),
            Text('Selected ($selected)'),
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (snapshot.hasData) {
                    final data =
                        snapshot.data!.docs
                            .map((doc) => User.fromJson(doc.data()))
                            .toList();
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(data[index].name),
                          subtitle: Text(data[index].id),
                          onTap: () {
                            from = data[index].id;
                            AppRoutes.chatbox.push(context);
                            setState(() {
                              selected++;
                            });
                          },
                        );
                      },
                    );
                  }
                  return Center(child: Text('No data found'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
