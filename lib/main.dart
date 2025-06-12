import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Web App Wrapper',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const WebAppContainer(),
    );
  }
}

class WebAppContainer extends StatefulWidget {
  const WebAppContainer({super.key});

  @override
  State<WebAppContainer> createState() => _WebAppContainerState();
}

class _WebAppContainerState extends State<WebAppContainer> {
  late final WebViewController _controller;

  final String webAppUrl = 'https://cashonspot.in'; // 🔁 Your hosted URL here

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(webAppUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: _controller)),
    );
  }
}
