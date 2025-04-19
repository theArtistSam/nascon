// part of '../chatbox.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nascon_prep/configs/configs.dart';
import '../chatbox.dart'; // For _MessageTile

class ChatScreen2 extends StatefulWidget {
  final String currentUserId;
  final String otherUserId;

  const ChatScreen2({
    super.key,
    required this.currentUserId,
    required this.otherUserId,
  });

  @override
  _ChatScreen2State createState() => _ChatScreen2State();
}

class _ChatScreen2State extends State<ChatScreen2> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String _chatId;

  @override
  void initState() {
    super.initState();
    // Create a unique chat ID by combining user IDs alphabetically
    _chatId = _createChatId(widget.currentUserId, widget.otherUserId);
  }

  String _createChatId(String userId1, String userId2) {
    // Sort the IDs to ensure consistent chat ID regardless of who initiates
    return userId1.compareTo(userId2) < 0
        ? '$userId1-$userId2'
        : '$userId2-$userId1';
  }

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    await _firestore
        .collection('chats')
        .doc(_chatId)
        .collection('messages')
        .add({
          'text': _messageController.text.trim(),
          'senderId': widget.currentUserId,
          'timestamp': FieldValue.serverTimestamp(),
        });

    // Update last message in chat info document
    await _firestore.collection('chats').doc(_chatId).set({
      'lastMessage': _messageController.text.trim(),
      'lastMessageTime': FieldValue.serverTimestamp(),
      'participants': [widget.currentUserId, widget.otherUserId],
    }, SetOptions(merge: true));

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<DocumentSnapshot>(
          future: _firestore.collection('users').doc(widget.otherUserId).get(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final userData = snapshot.data!.data() as Map<String, dynamic>?;
              return Text(userData?['name'] ?? 'Chat');
            }
            return Text('Chat');
          },
        ),
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  _firestore
                      .collection('chats')
                      .doc(_chatId)
                      .collection('messages')
                      .orderBy('timestamp', descending: true)
                      .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No messages yet'));
                }

                return ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final doc = snapshot.data!.docs[index];
                    final data = doc.data() as Map<String, dynamic>;
                    final isOther = data['senderId'] != widget.currentUserId;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: _MessageTile(
                        text: data['text'] ?? '',
                        isOther: isOther,
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // Message input
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.purple,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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

// final currid = '2uo79zX41UF9wM3KN9FK';

// class _Body extends StatefulWidget {
//   final String to;
//   final String from;
//   const _Body({required this.to, required this.from});

//   @override
//   State<_Body> createState() => _BodyState();
// }

// class _BodyState extends State<_Body> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppAppbar(title: 'Chatbox', isBack: true, isTrailing: false),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               color: AppTheme.background,
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       child: Image.network(
//                         Static.personImg,
//                         width: 50,
//                         height: 50,
//                       ),
//                     ),
//                     const SizedBox(width: 15),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Person name",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text("Some text message"),
//                       ],
//                     ),
//                     const Spacer(),
//                     AppIconButton(
//                       icon: Iconsax.call,
//                       iconColor: AppTheme.purple,
//                       color: AppTheme.background,
//                     ),
//                     const SizedBox(width: 10),
//                     AppIconButton(
//                       icon: Iconsax.video,
//                       iconColor: AppTheme.purple,
//                       color: AppTheme.background,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Divider(color: AppTheme.textGrey),
//             const SizedBox(height: 20),
//             Expanded(
//               child: StreamBuilder(
//                 stream:
//                     FirebaseFirestore.instance
//                         .collection('users')
//                         .where(widget.to, isEqualTo: currid)
//                         .snapshots(),
//                 builder: (ctx, snp) {
//                   if (snp.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                   if (snp.hasError) {
//                     return Center(child: Text('Error: ${snp.error}'));
//                   }
//                   if (snp.hasData) {
//                     final data =
//                         snp.data!.docs.map((doc) => doc.data()).toList();
//                     return ListView.builder(
//                       itemCount: data.length,
//                       itemBuilder: (context, index) {
//                         return _MessageTile(
//                           text: data[index]['message'],
//                           isOther: data[index]['sender'] == widget.to,
//                         );
//                       },
//                     );
//                   }
//                   return Center(child: Text('No data found'));
//                 },
//               ),
//             ),
//             // ListView.separated(
//             //   padding: EdgeInsets.symmetric(vertical: 20),
//             //   shrinkWrap: true,
//             //   physics: NeverScrollableScrollPhysics(),
//             //   itemBuilder: (context, index) {
//             //     if (index % 2 == 0) {
//             //       return _MessageTile(text: 'Some Text Message');
//             //     }
//             //     return _MessageTile(text: 'Some Text Message', isOther: true);
//             //   },
//             //   separatorBuilder: (context, index) {
//             //     return SizedBox(height: 10);
//             //   },
//             //   itemCount: 5,
//             // ),
//           ],
//         ),
//       ),
//       bottomSheet: Container(
//         color: AppTheme.background,
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//             spacing: 10,
//             children: [
//               Expanded(
//                 child: AppTextfield(
//                   isPrefix: false,
//                   hintText: 'Write a Message',
//                 ),
//               ),
//               AppIconButton(icon: Iconsax.send1),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
