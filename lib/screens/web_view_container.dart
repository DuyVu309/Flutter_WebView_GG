import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widget/colored_status_bar.dart';

class WebViewContainer extends StatefulWidget {
  final url;

  WebViewContainer(this.url);

  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();

  _WebViewContainerState(this._url);

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
        brightness: Brightness.light,
        // colored_status_bar.dart: AppBar(),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                    child: WebView(
                        key: _key,
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: _url))
              ],
            ),
          ),
        ));
  }
}
