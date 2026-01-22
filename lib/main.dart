import "package:custom_error_widget/custom_error_widget.dart";
import "package:flutter/material.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return CustomErrorWidget(details: details);
  };

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScreenA(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen A")),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              final MaterialPageRoute<void> route = MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return const ScreenB();
                },
              );
              await Navigator.push(context, route);
            },
            child: const Text("Go to Screen B"),
          ),
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    String? value;

    return Scaffold(
      appBar: AppBar(title: const Text("Screen B")),
      body: SafeArea(child: Center(child: Text(value!))),
    );
  }
}
