import 'package:flutter/material.dart';
import 'package:platformchannel/channel.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  var currentValue = 10.0;
  final _channel = Channel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Method Channel'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotatedBox(
            quarterTurns: 0,
            child: Slider(
              min: 1,
              max: 255,
              value: currentValue,
              onChanged: (value) {
                _channel.changeBrightnessScreen(value.toInt());
                setState(() {
                  currentValue = value;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var status = await _channel.checkPermission();

              if (status == false) {
                _showPermissionDialog();
              }
            },
            child: const Text(
              'Verificar permissao',
            ),
          ),
        ],
      ),
    );
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
              'Para mudar o brilho de tela é preciso conceder uma permissão.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _channel.openPermissionSettings();
                Navigator.pop(context);
              },
              child: const Text('Permissões'),
            ),
          ],
        );
      },
    );
  }
}
