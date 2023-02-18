import 'package:flutter/material.dart';
import 'dart:js';

class MyForm extends StatefulWidget {
  final String? myurl;

  MyForm(this.myurl);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final nameController = TextEditingController();
  final commentController = TextEditingController();

  String name = "";
  String comment = "";

  @override
  void dispose() {
    nameController.dispose();
    commentController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String name) async {
    final String url = '${widget.myurl}?id=$name';
    context.callMethod('open', [url]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My Form'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '名前を入力',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: nameController,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 16.0),
            Text(
              '感想を入力',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: commentController,
              onChanged: (value) {
                setState(() {
                  comment = value;
                });
              },
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 56,
        child: ElevatedButton(
          onPressed: name == ""
              ? null
              : () {
                  _launchUrl(name);
                },
          child: Icon(
            Icons.arrow_forward_rounded,
            size: 32,
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
          ),
        ),
      ),
    );
  }
}
