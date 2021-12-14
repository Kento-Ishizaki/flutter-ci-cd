import 'package:flutter/material.dart';
import 'package:flutter_ci_cd/models/greeting.dart';

class GreetingPage extends StatefulWidget {
  GreetingPage({Key? key}) : super(key: key);

  @override
  _GreetingPageState createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {
  final _nameCont = TextEditingController();
  var _name = '';
  final _greeting = Greeting();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              key: const Key('name text field'),
              decoration: InputDecoration(labelText: '名前'),
              controller: _nameCont,
            ),
            Text(
              _greeting.greeting(_name),
              key: const Key('greeting text'),
            ),
            ElevatedButton(
              key: const Key('greeting button'),
              child: Text('あいさつする'),
              onPressed: () {
                setState(() {
                  _name = _nameCont.text;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
