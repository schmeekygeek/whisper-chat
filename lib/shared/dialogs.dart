import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error,
                color: Colors.red,
                size: 35,
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
      );
    },
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    builder: (context) => Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Center(
          child: LottieBuilder.asset(
            'assets/loading2.json',
            height: 150,
            frameRate: FrameRate.max,
          ),
        ),
      ),
    ),
    context: context,
  );
}
