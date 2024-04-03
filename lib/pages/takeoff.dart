import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:whisper_chat/classes/client.dart';
import 'package:whisper_chat/classes/location.dart';
import 'package:whisper_chat/classes/message.dart';
import 'package:whisper_chat/extensions.dart';
import 'package:whisper_chat/pages/loading_page.dart';
import 'package:whisper_chat/shared/loading_dialog.dart';

import '../providers/misc_provider.dart';
import '../providers/theme_model.dart';
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

  String _username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Whisper\nChat',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontFamily: 'LobsterTwo',
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedTextKit(
                displayFullTextOnTap: true,
                pause: const Duration(milliseconds: 1500),
                repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText(
                    'Anonymous.',
                  ),
                  TyperAnimatedText(
                    'Safe.',
                  ),
                  TyperAnimatedText(
                    'Easy.',
                  ),
                  TyperAnimatedText(
                    'Fast.',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Let\'s get to know you',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Staatliches',
                fontSize: 20,
                letterSpacing: 3,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
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
            const SizedBox(
              height: 30,
            ),
            const Text(
              'What range would you like?',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Staatliches',
                fontSize: 20,
                letterSpacing: 3,
                color: Colors.blueGrey,
              ),
            ),
            DropdownButton(
              elevation: 3,
              hint: Text('${context.watch<MiscProvider>().getRange} kms'),
              underline: const SizedBox(),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              padding: const EdgeInsets.all(4),
              items: const [
                DropdownMenuItem(
                  value: 10,
                  child: Text('10 kms'),
                ),
                DropdownMenuItem(
                  value: 50,
                  child: Text('50 kms'),
                ),
                DropdownMenuItem(
                  value: 100,
                  child: Text('100 kms'),
                ),
                DropdownMenuItem(
                  value: 500,
                  child: Text('500 kms'),
                ),
              ],
              onChanged: (value) => context.read<MiscProvider>().setRange(value ?? 0),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Dark.blue),
              ),
              icon: const Text(
                'LET\'S GO',
                style: TextStyle(
                  color: Dark.crust,
                  fontFamily: 'Staatliches',
                  fontSize: 22,
                ),
              ),
              onPressed: () async {
                Position position;
                try {
                  showLoadingDialog(context);
                  position = await determinePosition();
                  if (!context.mounted) return;
                  context.pop();
                  print(position.latitude);
                  print(position.longitude);
                  context.push(
                    LoadingPage(
                      message: Message(
                        type: bindmsg,
                        from: Client(
                          username: _username,
                          location: Location(lat: position.latitude, long: position.longitude),
                          range: context.read<MiscProvider>().getRange
                        ),
                        body: ''
                      )
                    )
                  );
                } catch (e) {
                  if (!context.mounted) return;
                  context.pop();
                  showErrorDialog(context, e.toString());
                }
              },
              label: const Icon(
                Icons.send,
                color: Dark.crust,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
