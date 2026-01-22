import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({required this.details, super.key});
  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error Occurred")),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Icon(Icons.error_outline),
                  const SizedBox(height: 16),
                  Text(
                    kReleaseMode
                        ? "Something went wrong. Please try again later."
                        : "Error occurred:\n${details.exceptionAsString()}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  if (!kReleaseMode && details.stack != null)
                    const SizedBox(height: 16),
                  if (!kReleaseMode && details.stack != null)
                    Text(
                      "Stack Trace:\n${details.stack}",
                      style: const TextStyle(fontSize: 12),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
