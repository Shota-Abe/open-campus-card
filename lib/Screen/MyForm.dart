import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_url_param/Repository/NameRepository.dart';
import 'dart:js';

import 'MyHomePage.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  _nextButtonTapped(context);
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

  void _nextButtonTapped(BuildContext context) {
    NameRepository.saveName(name);

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => MyHomePage(
    //               widget.myurl,
    //               name,
    //             )),
    //   );
    // });

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => MyHomePage(
    //             widget.myurl,
    //             name,
    //           )),
    // );

    _launchUrl(name);
  }

  Future<void> _launchUrl(String name) async {
    final String url = '${widget.myurl}?name=$name';
    window.open(url, '_self');
  }
}
