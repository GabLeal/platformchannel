import 'package:flutter/material.dart';

class EventChannelExamplePage extends StatefulWidget {
  const EventChannelExamplePage({Key? key}) : super(key: key);

  @override
  _EventChannelExamplePageState createState() =>
      _EventChannelExamplePageState();
}

class _EventChannelExamplePageState extends State<EventChannelExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Channel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<double>(
              stream: null,
              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                if (snapshot.hasData) {
                  return Text("temperatura ${snapshot.data}");
                } else {
                  return const Center(
                    child: Text(
                      "Sem temperatura informada. Antes de alterar a temperatura no emulador é preciso ativar o sensor.",
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                const snackBar = SnackBar(
                  content: Text('Sensor ativado'),
                  backgroundColor: (Colors.blue),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text(
                'Ativar sensor de temperatura',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
