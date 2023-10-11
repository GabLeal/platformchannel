import 'package:flutter/material.dart';
import 'package:platformchannel/pages/method_channel_example_page.dart';
import 'package:platformchannel/pages/event_channel_example_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Platform Channel'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MethodChannelExamplePage(),
                  ),
                );
              },
              child: const Text('Exemplo method channel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EventChannelExamplePage(),
                  ),
                );
              },
              child: const Text('Exemplo event channel'),
            )
          ],
        ),
      ),
    );
  }
}
