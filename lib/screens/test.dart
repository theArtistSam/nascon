import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreTestPage extends StatefulWidget {
  @override
  _FirestoreTestPageState createState() => _FirestoreTestPageState();
}

class _FirestoreTestPageState extends State<FirestoreTestPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _message = "Not yet tested.";

  // Test Write operation
  Future<void> _testWrite() async {
    try {
      // Write data to Firestore
      await _firestore.collection('test_collection').doc('test_doc').set({
        'name': 'John Doe',
        'email': 'john.doe@example.com',
      });
      setState(() {
        _message = "Write successful!";
      });
    } catch (e) {
      setState(() {
        _message = "Write failed: $e";
      });
    }
  }

  // Test Read operation
  Future<void> _testRead() async {
    try {
      // Read data from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('test_collection').doc('test_doc').get();
      setState(() {
        _message =
            doc.exists
                ? "Read successful: ${doc.data()}"
                : "Document not found.";
      });
    } catch (e) {
      setState(() {
        _message = "Read failed: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firestore Security Test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _testWrite,
              child: Text('Test Write to Firestore'),
            ),
            ElevatedButton(
              onPressed: _testRead,
              child: Text('Test Read from Firestore'),
            ),
            SizedBox(height: 20),
            Text(_message),
          ],
        ),
      ),
    );
  }
}
