import 'package:flutter/material.dart';
import 'package:platformchannel/temperature.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _temperature = Temperature();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Channel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder<double>(
                stream: _temperature.getTemperatureStream,
                builder:
                    (BuildContext context, AsyncSnapshot<double> snapshot) {
                  if (snapshot.hasData) {
                    return Text("temperatura ${snapshot.data}");
                  } else {
                    return const Center(
                      child: Text(
                        "Sem temperatura informada. Antes de alterar a temperatura no emulador ative o sensor de temperatura.",
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _temperature.activeSensor();
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
      ),
    );
  }
}
