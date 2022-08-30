import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
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
              // stream: _temperature.getTemperatureStream,
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
