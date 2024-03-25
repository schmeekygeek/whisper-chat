import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:whisper_chat/shared/dialogs.dart';
import 'package:whisper_chat/util.dart';

class Takeoff extends StatefulWidget {
  const Takeoff({
    super.key,
  });

  @override
  State<Takeoff> createState() => _TakeoffState();
}

class _TakeoffState extends State<Takeoff> {

  late String _username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              autofillHints: const [
                AutofillHints.username,
              ],
              keyboardType: TextInputType.emailAddress,
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
                hintText: 'Email',
              ),
              style: Theme.of(context).textTheme.bodyMedium,
              obscureText: false,
              validator: (value) {
                return null;
              },
            ),
            TextButton.icon(
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
            )
          ],
        ),
      ),
    );
  }
}
