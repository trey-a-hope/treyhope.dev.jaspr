import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// A widget that displays web content in a WebView
class WebviewWidget extends StatefulWidget {
  final String url;

  const WebviewWidget(this.url, {super.key});

  @override
  State<WebviewWidget> createState() => _WebviewWidgetState();
}

class _WebviewWidgetState extends State<WebviewWidget> {
  late final WebViewController controller;

  // Controller for capturing screenshots (currently unused)
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    // Configure the WebView with JavaScript enabled and load the URL
    controller = WebViewController()
      // ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) => WebViewWidget(controller: controller);
}
