import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widget/colored_status_bar.dart';

class BridgeJs extends StatefulWidget {
  final url;

  BridgeJs(this.url);

  @override
  createState() => _BridgeJsState(this.url);
}

class _BridgeJsState extends State<BridgeJs> {
  var _url;
  bool isLoading = true;
  _BridgeJsState(this._url);

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
        brightness: Brightness.light,
        // colored_status_bar.dart: AppBar(),
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Visibility(
                  visible: true,
                  child: Expanded(
                      child: WebView(
                          javascriptMode: JavascriptMode.unrestricted,
                          initialUrl: _url,
                          onPageFinished: (String url){
                            setState((){
                              isLoading = false;
                            });
                          },
                      )),
                ),
                isLoading ? Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Colors.red),
                    ),
                  ),
                  backgroundColor: Colors.red.withOpacity(0.2))
                : Container(
                  child: Center(child: Text("Load completed", style: TextStyle(fontSize: 20, color: Colors.red))),
                )
              ],
            ),
          ),
        ));
  }
}
