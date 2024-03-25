import 'package:flutter/material.dart';

showTraceDialog(BuildContext context, Exception exception) {
  showDialog(context: context, builder: (context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text('Something went wrong'),
            Text('Runtime type: ${exception.runtimeType.toString()}'),
            const SizedBox(
              height: 20,
            ),
            Text('Trace: ${exception.toString()}'),
          ],
        ),
      ),
  ));
}

showErrorDialog(BuildContext context, String message) { 
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            child: Column(
              children: [
                const Expanded(
                  flex: 2,
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 35,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
