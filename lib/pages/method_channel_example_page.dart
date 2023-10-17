import 'package:flutter/material.dart';

class MethodChannelExamplePage extends StatefulWidget {
  const MethodChannelExamplePage({Key? key}) : super(key: key);

  @override
  _MethodChannelExamplePageState createState() =>
      _MethodChannelExamplePageState();
}

class _MethodChannelExamplePageState extends State<MethodChannelExamplePage> {
  var currentValue = 10.0;
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
              onChanged: (value) {},
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Verificar permissao'),
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
              onPressed: () {
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
