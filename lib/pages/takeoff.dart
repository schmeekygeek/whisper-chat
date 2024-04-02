import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:whisper_chat/providers/theme_model.dart';

import '../shared/dialogs.dart';
import '../util.dart';

class Takeoff extends StatefulWidget {
  const Takeoff({
    super.key,
  });

  @override
  State<Takeoff> createState() => _TakeoffState();
}

class _TakeoffState extends State<Takeoff> {

  late String _username;
  int _range = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'WHISPER\nCHAT',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
                autofillHints: const [
                  AutofillHints.username,
                ],
                keyboardType: TextInputType.text,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onChanged: (value) => _username = value,
                decoration: const InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                      right: 15,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 19,
                    ),
                  ),
                  hintText: 'Username',
                ),
                style: Theme.of(context).textTheme.bodyMedium,
                obscureText: false,
                validator: (value) {
                  return null;
                },
              ),
            ),
            Expanded(
              child: DropdownButton(
                hint: Text('$_range'),
                items: const [
                  DropdownMenuItem(
                    value: 10,
                    child: Text('10'),
                  ),
                  DropdownMenuItem(
                    value: 50,
                    child: Text('50'),
                  ),
                  DropdownMenuItem(
                    value: 100,
                    child: Text('100'),
                  ),
                ],
                onChanged: (value) => _range = value!,
              ),
            ),
            Expanded(
              flex: 2,
              child: TextButton.icon(
                label: const Text('Go'),
                onPressed: () async {
                  Position position;
                  try {
                    position = await determinePosition();
                    print(position.latitude);
                    print(position.longitude);
                  } catch (e) {
                    if (!context.mounted) return;
                    showTraceDialog(context, Exception(e));
                  }
                },
                icon: const Icon(Icons.send)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
