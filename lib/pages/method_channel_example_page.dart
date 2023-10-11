import 'package:flutter/material.dart';
import 'package:platformchannel/channels/brightness_channel.dart';

class MethodChannelExamplePage extends StatefulWidget {
  const MethodChannelExamplePage({Key? key}) : super(key: key);

  @override
  _MethodChannelExamplePageState createState() =>
      _MethodChannelExamplePageState();
}

class _MethodChannelExamplePageState extends State<MethodChannelExamplePage> {
  var currentValue = 10.0;
  final _brightnessChannel = BrightnessChannel();
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
                _brightnessChannel.changeBrightnessScreen(value.toInt());
                setState(() {
                  currentValue = value;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              var status = await _brightnessChannel.checkPermission();

              if (status == false) {
                _showPermissionDialog();
                return;
              }

              const snackBar = SnackBar(
                content: Text('Você já possui permissão.'),
                backgroundColor: (Colors.blue),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                await _brightnessChannel.openPermissionSettings();
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
