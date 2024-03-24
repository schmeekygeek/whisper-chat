import 'package:flutter/material.dart';

class Takeoff extends StatefulWidget {
  const Takeoff({
    super.key,
  });

  @override
  State<Takeoff> createState() => _TakeoffState();
}

class _TakeoffState extends State<Takeoff> {

  @override
  void initState() {
    super.initState();
  }

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
          ],
        ),
      ),
    );
  }
}
