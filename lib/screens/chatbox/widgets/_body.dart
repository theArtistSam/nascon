part of '../chatbox.dart';

final currid = '2uo79zX41UF9wM3KN9FK';

class _Body extends StatefulWidget {
  final String to;
  final String from;
  const _Body({required this.to, required this.from});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
  }

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
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance
                        .collection('users')
                        .where(widget.to, isEqualTo: currid)
                        .snapshots(),
                builder: (ctx, snp) {
                  if (snp.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snp.hasError) {
                    return Center(child: Text('Error: ${snp.error}'));
                  }
                  if (snp.hasData) {
                    final data =
                        snp.data!.docs.map((doc) => doc.data()).toList();
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return _MessageTile(
                          text: data[index]['message'],
                          isOther: data[index]['sender'] == widget.to,
                        );
                      },
                    );
                  }
                  return Center(child: Text('No data found'));
                },
              ),
            ),
            // ListView.separated(
            //   padding: EdgeInsets.symmetric(vertical: 20),
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     if (index % 2 == 0) {
            //       return _MessageTile(text: 'Some Text Message');
            //     }
            //     return _MessageTile(text: 'Some Text Message', isOther: true);
            //   },
            //   separatorBuilder: (context, index) {
            //     return SizedBox(height: 10);
            //   },
            //   itemCount: 5,
            // ),
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
